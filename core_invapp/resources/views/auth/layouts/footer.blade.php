<div class="nk-footer nk-auth-footer-full">
    <div class="container wide-lg">
        @if(Panel::navigation('footer'))
        <div class="row g-3">
            <div class="col-lg-6 order-lg-last">
                {!! Panel::navigation('footer', ['class' => 'justify-content-center justify-content-lg-end']) !!}
            </div>
            <div class="col-lg-6">
                <div class="nk-block-content text-center text-lg-left">
                    <p class="text-soft">{!! __(site_info('copyright')) !!}</p>
                </div>
            </div>
        </div>
        @else 
        <p class="text-soft text-center">{!! __(site_info('copyright')) !!}</p>
        @endif
    </div>
</div>
<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/6159bc30d326717cb6847f3d/1fh38e7vg';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
