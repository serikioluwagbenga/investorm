@extends('auth.layouts.master')

@section('title', __('Registration Complete'))

@section('content')
<div class="card card-bordered">
    <div class="card-inner card-inner-lg">
        <div class="nk-block-head text-center">
            <h4 class="nk-block-title">{{ __('Registration completed successfully.') }}</h4>
        </div>
        <div class="nk-block-content text-center">
            <p><strong>{{ __('Thank you for signing up!') }}</strong></p>
            <p>{{ __('Please click the login button below to proceed into your account.') }}</p>
            <div class="gap gap-md"></div>
            <a class="btn btn-lg btn-block btn-primary" href="{{ route('auth.login.form') }}">{{ __('Login your account') }}</a>
        </div>
    </div>
</div>
@endsection
