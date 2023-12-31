<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GTX</title>
    <link rel="stylesheet" href="/gtx2/css/stylegtx.css">
    <link rel="shortcut icon" href="/gtx2/css/imagens/logotrans.png" type="image/x-png">
</head>
<body>
    <header>
        <div class="cabecalho">
            <h1>GHOST TÓXIC TEAM</h1>
        </div>
        <div class="navegador">
            <nav>
                <ul>
                    <li><a class="aNavegador" href="/gtx2/control/control.inicio.php" >Inicio</a></li>
                    <li><a class="aNavegador" href="/gtx2/control/control.areaLogada.php">Área logada</a></li>
                    <li><a class="aNavegador" href="/gtx2/control/control.salaVideos.php">Sala de videos</a></li>
                    <li><a class="aNavegador" href="/gtx2/control/control.membros.php">Membros</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <main class="principal">
        <div>
            <table id="membros">
                <caption>MEMBROS</caption>
                <thead>
                    <tr>
                        <th style="width: 220px;">Nome</th>
                        <th style="width: 143px;">Origin</th>
                        <th style="width: 108px;">Cargo</th>
                        <th style="width: 143px;">Nick stream</th>
                        <th style="width: 78px;">Plataforma</th>
                    </tr>
                </thead>
                <?php if ($consulta->rowCount() > 0): ?>
                <?php while ($resultado = $consulta->fetch(PDO::FETCH_ASSOC)):?>
                <tr id="lista">
                    <td><?php echo $resultado['nome'];?></td>
                    <td><?php echo $resultado['nick'];?></td>
                    <td><?php echo $resultado['cargo'];?></td>
                    <td><a id="linkcanal" href="https://<?php echo $resultado['link_canal'];?>" target="_blank" title="Clique aqui para ir ao canal!"><?php echo $resultado['nickstream'];?></a></td>
                    <td><?php echo $resultado['plataforma'];?></td>
                </tr>
                <?php endwhile ?>
                <?php else: ?>
                    <tr id="lista">
                        <td colspan="5">Nenhum membro encontrado!</td>
                    </tr>
                <?php endif; ?>
            </table>
        </div>
    </main>
    <footer>
        <p>Ghost tóxic team&trade;</p>
        <p>Todos os direitos reservados&copy;</p>
        <p>2023</p>
    </footer>
</body>
</html>