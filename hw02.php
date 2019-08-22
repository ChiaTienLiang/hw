<table border="1" width="100%">

    <?php
    $num = range(1, 52);
    $poke = array();
    // var_dump($num);
    $values = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K'];

    for ($i = 51; $i >= 0; $i--) { //洗牌 (隨機抓一張丟到陣列最後一個位置，遞減)
        $j = rand(0, $i);
        $temp = $num[$j];
        for ($j; $j < $i; $j++) {
            $num[$j] = $num[$j + 1];
        }
        $num[$i] = $temp;
    }

    ///////////////////////////////////////////////////////////////////

    for ($i = 0; $i < 13; $i++) {  //依序發給四人
        for ($j = 0; $j < 4; $j++) {
            $x =  $j + $i * 4;
            $poke[$j][$i] = $num[$x];
        }
    }

    // foreach ($poke as $poke) { 
    //      echo '<tr>'; 
    //     foreach ($poke as $card)
    //         echo '<td>' . $card . '</td>';
    //      echo '</tr>'; 
    // }

    for ($i = 0; $i < 4; $i++) {  //排序列出
        sort($poke[$i]);
        echo '<tr><td>玩家' . ($i + 1) . '</td>';
        for ($j = 0; $j < 13; $j++) {
            $x = (int) ($poke[$i][$j] / 13);
            $y = $poke[$i][$j] % 13;
            

            if ($y == 0) {
                switch ($x) {
                    case 1:
                        echo '<td>♠13</td>';
                        break;
                    case 2:
                        echo '<td style="color:red">♥K</td>';
                        break;
                    case 3:
                        echo '<td style="color:red">♦13</td>';
                        break;
                    case 4:
                        echo '<td>♣13</td>';
                        break;
                }
            } else {
                switch ($x) {
                    case 0:
                        echo '<td>♠' . $values[($y - 1)] . '</td>';
                        break;
                    case 1:
                        echo '<td style="color:red">♥' . $values[($y - 1)]  . '</td>';
                        break;
                    case 2:
                        echo '<td style="color:red">♦' . $values[($y - 1)]  . '</td>';
                        break;
                    case 3:
                        echo '<td>♣' . $values[($y - 1)]  . '</td>';
                        break;
                }
            }
            // echo '<td>' . $poke[$i][$j] . '</td>';
        }
        echo '</tr>';
    }

    ?>
</table>