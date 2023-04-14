@if ($paginator->hasPages())
    <div class="g">
        <ul class="pagination justify-content-center justify-content-md-start">
            @if($paginator->onFirstPage())
                <li class="page-item"><a class="page-link disabled"
                                         href="javascript:void(0)">{{ __('Prev') }}</a></li>
            @else
                <li class="page-item"><a class="page-link"
                                         href="{{ $paginator->previousPageUrl() }}">{{ __('Prev') }}</a></li>
            @endif

            @foreach ($elements as $element)
                @if (is_string($element))
                    <li class="page-item"><span class="page-link"><em class="icon ni ni-more-h"></em></span></li>
                @endif

                @if (is_array($element))
                    @foreach ($element as $page => $url)
                        @if ($page == $paginator->currentPage())
                            <li class="page-item active"><a class="page-link" href="javascript:void(0)">{{ $page }}</a>
                            </li>
                        @else
                            <li class="page-item"><a class="page-link" href="{{$url}}">{{ $page }}</a></li>
                        @endif
                    @endforeach
                @endif
            @endforeach

            @if ($paginator->hasMorePages())
                <li class="page-item"><a class="page-link" href="{{ $paginator->nextPageUrl() }}">{{ __('Next') }}</a>
                </li>
            @else
                <li class="page-item"><a class="page-link disabled" href="javascript:void(0)">{{ __('Next') }}</a></li>
            @endif
        </ul>
    </div>
    <div class="g">
        <div class="pagination-goto d-flex justify-content-center justify-content-md-start gx-3">
            <div>{{ __('Page') }}</div>
            <div>
                <select class="form-select form-select-sm pagination-dropdown" data-search="on" data-dropdown="xs center">
                    @for($i = 1; $i <= $paginator->lastPage(); $i++ )
                        <option value="{{ $paginator->url($i) }}" @if($i == $paginator->currentPage()) selected @endif>{{ $i }}</option>
                    @endfor
                </select>
            </div>
            <div>{{ __('OF') }} {{ $paginator->lastPage() }}</div>
        </div>
    </div>
@endif
