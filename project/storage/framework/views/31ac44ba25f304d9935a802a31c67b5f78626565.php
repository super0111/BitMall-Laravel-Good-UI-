<aside class="dashboard-sidebar">
    <div class="bg--gradient">&nbsp;</div>
    <div class="dashboard-sidebar-inner">
        <div class="user-sidebar-header">
            <a href="<?php echo e(url('/')); ?>">
                <img src="<?php echo e(getPhoto($gs->header_logo)); ?>" alt="logo">
            </a>
            <div class="sidebar-close">
                <span class="close">&nbsp;</span>
            </div>
        </div>
        <div class="user-sidebar-body">
            <ul class="user-sidbar-link">
                <li>
                    <span class="subtitle"><?php echo translate('General'); ?></span>
                </li>
                <li>
                    <a href="<?php echo e(route('user.dashboard')); ?>" class="<?php echo e(menu('user.dashboard')); ?>">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <?php echo translate('Dashboard'); ?>
                    </a>
                </li>


                <li>
                    <a href="<?php echo e(route('user.transactions')); ?>" class="<?php echo e(menu('user.transactions')); ?>">
                        <span class="icon"><i class="fas fa-history"></i></span>
                        <?php echo translate('Transactions'); ?>
                    </a>
                </li>

                <li>
                    <a href="<?php echo e(route('user.blog.index')); ?>" class="<?php echo e(menu(['user.blog.index','user.blog.create','user.blog.edit'])); ?>">
                        <span class="icon"><i class="fas fa-blog"></i></span>
                        <?php echo translate('Manage Blogs'); ?>
                    </a>
                </li>
               


                <li>
                    <span class="subtitle"><?php echo translate('Offer/Trade'); ?></span>
                </li>
                <li>
                    <a href="<?php echo e(route('user.offer.index')); ?>" class="<?php echo e(menu('user.offer.index')); ?>">
                        <span class="icon"><i class="fas fa-gift"></i></span>
                        <?php echo translate('Your Offers'); ?>
                    </a>
                </li>
                <li>
                    <a href="<?php echo e(route('user.offer.create')); ?>" class="<?php echo e(menu('user.offer.create')); ?>">
                        <span class="icon"><i class="fas fa-folder-plus"></i></span>
                       <?php echo translate(' Create Offer'); ?>
                    </a>
                </li>

                <li>
                    <a href="<?php echo e(route('user.trade.all')); ?>" class="<?php echo e(menu('user.trade.all')); ?>">
                        <span class="icon"><i class="fas fa-history"></i></span>
                        <?php echo translate('My Trades'); ?>
                    </a>
                </li>
                <li>
                    <a href="<?php echo e(route('user.trade.requests')); ?>" class="<?php echo e(menu('user.trade.requests')); ?>">
                        <span class="icon"><i class="fas fa-history"></i></span>
                        <?php echo translate('Trade Requests'); ?> 
                        <?php if($trade_requests > 0): ?>
                        <span class="badge badge--base badge-sm ms-3"><?php echo e($trade_requests); ?></span>
                        <?php endif; ?>
                    </a>
                </li>
                <li>
                    <a href="<?php echo e(route('offer.list',['type' => 'buy'])); ?>" >
                        <span class="icon"><i class="fas fa-handshake"></i></span>
                        <?php echo translate('Buy'); ?>
                    </a>
                </li>
                <li>
                    <a href="<?php echo e(route('offer.list',['type' => 'sell'])); ?>" >
                        <span class="icon"><i class="fas fa-handshake"></i></span>
                        <?php echo translate('Sell'); ?>
                    </a>
                </li>

                <li>
                    <span class="subtitle"><?php echo translate('Deposit'); ?></span>
                </li>
                
                <li>
                    <a href="<?php echo e(route('user.deposit.index')); ?>" class="<?php echo e(menu('user.deposit.index')); ?>">
                        <span class="icon"><i class="fas fa-coins"></i></span>
                        <?php echo translate('Deposit'); ?>
                    </a>
                </li>
                <li>
                    <a href="<?php echo e(route('user.deposit.history')); ?>" class="<?php echo e(menu('user.deposit.history')); ?>">
                        <span class="icon"><i class="fas fa-history"></i></span>
                        <?php echo translate('Deposit History'); ?>
                    </a>
                </li>

                <li>
                    <span class="subtitle"><?php echo translate('Withdraw'); ?></span>
                </li>
                <li>
                    <a href="<?php echo e(route('user.withdraw.wallets')); ?>" class="<?php echo e(menu('user.withdraw.wallets')); ?>">
                        <span class="icon"><i class="fas fa-file-invoice-dollar"></i></span>
                       <?php echo translate(' Withdraw'); ?>
                    </a>
                </li>
                <li>
                    <a href="<?php echo e(route('user.withdraw.history')); ?>" class="<?php echo e(menu('user.withdraw.history')); ?>">
                        <span class="icon"><i class="fas fa-history"></i></span>
                        <?php echo translate('Withdraw History'); ?>
                    </a>
                </li>
                <li>
                    <span class="subtitle"><?php echo translate('Profile Settings'); ?></span>
                </li>
                <li>
                    <a href="<?php echo e(route('user.profile')); ?>" class="<?php echo e(menu('user.profile')); ?>">
                        <span class="icon"><i class="fas fa-user-circle"></i></span>
                        <?php echo translate('Profile Settings'); ?>
                    </a>
                </li>
                <li>
                    <a href="<?php echo e(route('user.change.pass')); ?>" class="<?php echo e(menu('user.change.pass')); ?>">
                        <span class="icon"><i class="fas fa-key"></i></span>
                        <?php echo translate('Change Password'); ?>
                    </a>
                </li>
                <li>
                    <a href="<?php echo e(route('user.verify.phone')); ?>" class="<?php echo e(menu('user.verify.phone')); ?>">
                        <span class="icon"><i class="fas fa-mobile-alt"></i></span>
                        <?php echo translate('Verify Phone no.'); ?>
                    </a>
                </li>
                <li>
                    
                <a href="<?php echo e(route('user.two.step')); ?>" class="<?php echo e(menu('user.two.step')); ?>">
                        <span class="icon"><i class="fas fa-lock"></i></span>
                        <?php echo translate('Two Step Verify'); ?>
                    </a>
                </li>

                <li>
                    <a href="<?php echo e(route('user.ticket.index')); ?>" class="<?php echo e(menu('user.ticket.index')); ?>">
                        <span class="icon"><i class="fas fa-headset"></i></span>
                        <?php echo translate('Support Ticket'); ?>
                    </a>
                </li>
               
                <li>
                    <a href="<?php echo e(route('user.logout')); ?>">
                        <span class="icon"><i class="fas fa-sign-in-alt"></i></span>
                        <?php echo translate('Logout'); ?>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</aside><?php /**PATH E:\james-backup\admin\project\resources\views/user/partials/sidebar.blade.php ENDPATH**/ ?>