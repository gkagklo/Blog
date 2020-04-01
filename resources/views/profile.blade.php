@extends('layouts.frontend.app')

@section('title','Profile')


@push('css')
<link href="{{ asset('assets/frontend/css/profile/styles.css')}}" rel="stylesheet">
<link href="{{ asset('assets/frontend/css/profile/responsive.css')}}" rel="stylesheet">
	<style>
			.favorite_posts{
				color:red;
			}
		</style>
@endpush

@section('content')


	<section class="blog-area section">
		<div class="container">

			<div class="row">

				<div class="col-lg-8 col-md-12">
                    <div class="row">
                    @if($posts->count() > 0)
                    @foreach($posts as $post)
                    <div class="col-md-6 col-sm-12">
                        <div class="card h-100">
                            <div class="single-post post-style-1">
        
                                <div class="blog-image"><img src="{{ asset('/storage/post/'.$post->image) }}" alt="Post Image"></div>
        
                                <div class="blog-info">
        
                                <h4 class="title"><a href="{{ route('post.details',$post->slug) }}"><b> {{ $post->title }} </b></a></h4>
        
                                    <ul class="post-footer">
                                        <li>
                                            @guest
                                                <a href="javascript:void(0);" onclick="toastr.info('To add this post on your favorite list you must login first.','Info',{
                                                    closeButton: true,
                                                    progressBar: true,
                                                })"><i class="ion-heart"></i>{{ $post->favorite_to_users->count() }}</a>
                                            @else
                                                <a href="javascript:void(0);" onclick="document.getElementById('favorite-form-{{ $post->id }}').submit();"
                                                   class="{{ !Auth::user()->favorite_posts->where('pivot.post_id',$post->id)->count()  == 0 ? 'favorite_posts' : ''}}"><i class="ion-heart"></i>{{ $post->favorite_to_users->count() }}</a>
        
                                                <form id="favorite-form-{{ $post->id }}" method="POST" action="{{ route('post.favorite',$post->id) }}" style="display: none;">
                                                    {{ csrf_field() }}
                                                </form>
                                            @endguest
                                    </li>
                                    <li><a href="javascript:void(0);" style="cursor: default;"><i class="ion-chatbubble"></i>{{ $post->comments->count() }}</a></li>
                                    <li><a href="javascript:void(0);" style="cursor: default;"><i class="ion-eye"></i>{{ $post->view_count }}</a></li>
                                    </ul>
        
                                </div><!-- blog-info -->
                            </div><!-- single-post -->
                        </div><!-- card -->
                    </div><!-- col-lg-4 col-md-6 -->
        
                    @endforeach
                        @else 
                            <div class="col-md-6 col-sm-12">
                                    
                                <div class="card h-100">
                                    <div class="single-post post-style-1">
                                        <div class="blog-info">
                                            <h4 class="title">
                                                <strong>Sorry, no post found.</strong>
                                            </h4>
                                        </div><!-- blog-info -->
                                    </div><!-- single-post -->
                                </div><!-- card -->
                            </div><!-- col-md-6 col-sm-12 -->
                            @endif
                    </div><!-- row -->


				</div><!-- col-lg-8 col-md-12 -->

				<div class="col-lg-4 col-md-12 ">

					<div class="single-post info-area ">

						<div class="about-area">
                            <h4 class="title"><b>ABOUT AUTHOR</b></h4>
                            <img style="border-radius:50%;height:200px;width:300px;" src="{{ asset('/storage/profile/'.$author->image) }}" alt="Profile Image">
                            <p>{{ $author->name}}</p><br>
                            <p>{{ $author->about}}</p><br>
                            <strong>Author since: {{ $author->created_at->format('d/m/Y') }} </strong><br>
                            <strong>Total posts: {{ $author->posts->count() }} </strong>
						</div>

					</div><!-- info-area -->

				</div><!-- col-lg-4 col-md-12 -->

			</div><!-- row -->

		</div><!-- container -->
	</section><!-- section -->

@endsection

@push('js')

@endpush