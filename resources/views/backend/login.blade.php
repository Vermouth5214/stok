@extends('backend.layouts.login')

@section('title', 'Login')

@section('content')
    <div>
        <div class="login_wrapper">
            <div class="animate form login_form">
                <section class="login_content">
                    <form method="post" id="formLogin">
                        <input type="hidden" name="_token" value="{{{ csrf_token() }}}" />
                        <h1>Login Form</h1>
                        <div class="error-alert"></div>
                        <div>
                            <input type="text" class="form-control" placeholder="Username" required="" name="username" />
                        </div>
                        <div>
                            <input type="password" class="form-control" placeholder="Password" required="" name="password" />
                        </div>
                        <div>
                            <button type="submit" class="btn btn-submit btn-primary ladda-button">Login</button> 
                            <a class="reset_pass" href="#">Lost your password?</a>
                        </div>
                        <div class="clearfix"></div>
                        <div class="separator">
                        <div class="clearfix"></div>
                        <div>
                            <h1><center><img src="<?=$setting['logo'];?>"; class='img-responsive'></center></h1>
                            <p>&copy;2017 <b>Version</b> 1.0.0 <strong>All rights reserved.</strong></p>
                        </div>
                        </div>
                    </form>
                </section>
            </div>
        </div>
    </div>
@endsection