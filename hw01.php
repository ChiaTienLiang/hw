<table border="1" width="100%">
    <?php
    $num[0] = range(1, 100);
    $num[1] = array_fill(1, count($num[0]), true);
    $num[1][0] = false; //1    
    for ($j = 2; $j < count($num[0]); $j++) {
        for ($i = 2; $i <= $j; $i++) {
            if ($num[0][$j] % $i == 0) {
                $num[1][$j] = false;
                break;
            }
        }
    }
    
    for ($i = 0; $i < 10; $i++) {
        echo '<tr>';
        for ($j = 0; $j < 10; $j++) {
            $a = $i * 10 + $j;
            $b = $a + 1;
            // echo "<td>{$a}</td>";
            if ($num[1][$a]) {
                echo "<td  bgcolor='lightgreen'>{$b}</td>";
            } else {
                echo "<td >{$b}</td>";
            }
        }
        echo '</tr>';
    }

    ?>
</table>