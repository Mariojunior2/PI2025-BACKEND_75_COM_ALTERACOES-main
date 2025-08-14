<?php
// Não inicia sessão novamente se já estiver ativa
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Verifica se o usuário está logado
$usuarioAtualId = $_SESSION['usuario_id'] ?? null;

if (!$usuarioAtualId) {
    // Redireciona para login se não estiver autenticado
    header('Location: index.php');
    exit;
}

// Usa dados da sessão para evitar consultas desnecessárias
$usuarioNome = $_SESSION['usuario_nome'] ?? 'Usuário';
$usuarioMatricula = $_SESSION['usuario_matricula'] ?? 'matricula';
$usuarioFoto = $_SESSION['usuario_foto'] ?? 'https://i.pravatar.cc/150?img=56';
?>

<nav class="sidebar d-flex flex-column p-3">
  <a href="#" class="d-flex align-items-center mb-4 text-decoration-none">
    <span class="fs-4 text-danger me-1">Tydra</span><span class="fs-4 text-white">PI</span>
  </a>

  <?php
    $currentPage = basename($_SERVER['PHP_SELF']);
    // Menus com sub-itens opcionais
    $menus = [
      [
        'label' => 'Recursos Educacionais',
        'icon'  => 'graduation-cap',
        'link'  => 'recursoeducacionais.php',
        'items' => [
          ['label'=>'Material de Estudo','icon'=>'book','href'=>'material.php'],
          ['label'=>'Video Aulas','icon'=>'video','href'=>'videos.php'],
          ['label'=>'Exercícios Práticos','icon'=>'tasks','href'=>'exercicios.php'],
          ['label'=>'Dicas de Estudo','icon'=>'lightbulb','href'=>'dicas.php'],
        ],
        'pages' => ['recursoeducacionais.php','material.php','videos.php','exercicios.php','dicas.php'],
      ],
      [
        'label' => 'Notificações',
        'icon'  => 'bell',
        'link'  => 'notific.php',
        'items' => [
          ['label'=>'Acadêmicas','icon'=>'book','href'=>'notif_academicas.php'],
          ['label'=>'Calendário','icon'=>'calendar','href'=>'calendario.php'],
          ['label'=>'Materiais','icon'=>'tasks','href'=>'notif_materiais.php'],
        ],
        'pages' => ['notific.php','notif_academicas.php','calendario.php','notif_materiais.php'],
      ],
    ];
  ?>

  <ul class="nav nav-pills flex-column mb-auto">
    <li><a href="hub.php" class="nav-link mb-2 <?= $currentPage=='hub.php'?'active':'' ?>"><i class="fas fa-home me-2"></i>Início</a></li>
    <li><a href="explorar.php" class="nav-link mb-2 <?= $currentPage=='explorar.php'?'active':'' ?>"><i class="fas fa-compass me-2"></i>Explorar</a></li>
    <li><a href="chat.php" class="nav-link mb-2 d-flex justify-content-between align-items-center <?= $currentPage=='chat.php'?'active':'' ?>"><span><i class="fas fa-comment me-2"></i>Mensagens</span><span class="badge bg-danger">7</span></a></li>
    <li><a href="comunidades.php" class="nav-link mb-2 <?= $currentPage=='comunidades.php'?'active':'' ?>"><i class="fas fa-users me-2"></i>Comunidades</a></li>

    <?php foreach($menus as $menu): ?>
      <?php $isActive = in_array($currentPage, $menu['pages']); ?>
      <?php if($isActive): ?>
        <li class="has-submenu active">
          <a href="<?= $menu['link'] ?>" class="nav-link d-flex justify-content-between align-items-center submenu-toggle active">
            <span><i class="fas fa-<?= $menu['icon'] ?> me-2"></i><?= $menu['label'] ?></span>
            <i class="fas fa-chevron-down submenu-icon"></i>
          </a>
          <ul class="sub-menu">
            <?php foreach($menu['items'] as $item): ?>
              <li><a href="<?= $item['href'] ?>" class="nav-link sub-link <?= $currentPage==basename($item['href'])?'active':'' ?>"><i class="fas fa-<?= $item['icon'] ?> me-2"></i><?= $item['label'] ?></a></li>
            <?php endforeach; ?>
          </ul>
        </li>
      <?php else: ?>
        <li>
          <a href="<?= $menu['link'] ?>" class="nav-link<?= $isActive?' active':'' ?>">
            <i class="fas fa-<?= $menu['icon'] ?> me-2"></i><?= $menu['label'] ?>
          </a>
        </li>
      <?php endif; ?>
    <?php endforeach; ?>

    <li><a href="perfil.php" class="nav-link <?= $currentPage=='perfil.php'?'active':'' ?>"><i class="fas fa-user me-2"></i>Perfil</a></li>
    <li><a href="configuracao.php" class="nav-link <?= $currentPage=='configuracao.php'?'active':'' ?>"><i class="fas fa-cog me-2"></i>Configurações</a></li>
  </ul>

  <hr class="border-secondary my-3">

  <div class="d-flex align-items-center">
     <?php
                                    // Gerar avatar baseado no nome do usuário
                                    $nome = urlencode($usuarioNome);
                                    $cor = substr(md5($usuarioNome), 0, 6);
                                    ?>
                                    <img src="https://ui-avatars.com/api/?name=<?= $nome ?>&background=<?= $cor ?>&color=fff" 
                                         alt="<?= htmlspecialchars($usuarioNome) ?>" 
                                          class="rounded-circle me-2" width="40" height="40">
    <div>
      <div><?= htmlspecialchars($usuarioNome) ?></div>
      <small class="text-secondary-custom">@<?= htmlspecialchars($usuarioMatricula) ?></small>
    </div>
    <span class="ms-auto bg-success rounded-circle status-indicator"></span>
  </div>
</nav>

<script>
  // Apenas adiciona o listener ao submenu ativo (se existir)
  const activeToggle = document.querySelector('.has-submenu.active .submenu-toggle');
  if(activeToggle){
    activeToggle.addEventListener('click', e=>{
      e.preventDefault();
      const menu = activeToggle.closest('.has-submenu');
      menu.classList.toggle('active');
    });

    // Fechar se clicar fora
    document.addEventListener('click', e=>{
      const menu = document.querySelector('.has-submenu.active');
      if(menu && !menu.contains(e.target)){
        menu.classList.remove('active');
      }
    });
  }
</script>
