@php 

$footer 	= isset($footer) ? $footer : false;
$ft_wide	= (isset($footer['wide'])) ? $footer['wide'] : '';
$ft_style	= (isset($footer['style'])) ? $footer['style'] : 'regular';
$ft_class 	= (isset($footer['class'])) ? ' '.$footer['class'] : '';

@endphp

<div class="nk-footer{{ $ft_class }}{{ (gui('user', 'sidebar')=='lighter') ? ' bg-lighter' : '' }}">
	<div class="{{ (($ft_wide) ? 'container wide-'.$ft_wide : 'container-fluid') }}">
		<div class="nk-footer-wrap">
		    <div class="nk-footer-copyright">{!! __(site_info('copyright')) !!}</div>
		    {!! Panel::navigation('footer', ['parent' => true]) !!}
		</div>
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