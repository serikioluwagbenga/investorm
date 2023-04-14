<footer class="section footer bg-white border-top" id="footer">
    <div class="container wide-lg">
        <div class="row">
            <div class="col-12">
                <div class="footer-content text-center">
                    {!! Panel::socials('footer', ['parent' => true, 'class' => 'icon-list mb-3']) !!}

                    <div class="text-base">{!! (is_admin()) ? '<span class="text-danger font-italic small">'.__("You have logged as a system administrator.").'</span>' : __(site_info('copyright')) !!}</div>

                    {!! Panel::navigation('footer', ['class' => 'justify-content-center py-3']) !!}

                    @if(gss('site_disclaimer'))
                    <p class="text-muted">{{ gss('site_disclaimer') }}</p>
                    @endif
                </div>
            </div>
        </div>
    </div>
</footer>
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