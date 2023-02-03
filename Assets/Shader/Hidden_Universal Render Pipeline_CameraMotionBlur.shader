//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Universal Render Pipeline/CameraMotionBlur" {
Properties {
}
SubShader {
 LOD 100
 Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
 Pass {
  Name "Camera Motion Blur - Low Quality"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 44630
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zz + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4_ViewProjM[4];
uniform 	vec4 hlslcc_mtx4x4_PrevViewProjM[4];
uniform 	float _Intensity;
uniform 	float _Clamp;
uniform 	vec4 _SourceSize;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _SourceTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec3 u_xlat10_2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.zw * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat10_1.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.x = u_xlat10_1.x * 2.0 + -1.0;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.0, 1.0, -1.0);
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_PrevViewProjM[1].xyw;
    u_xlat1.xyz = hlslcc_mtx4x4_PrevViewProjM[0].xyw * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PrevViewProjM[2].xyw * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4_PrevViewProjM[3].xyw;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.zz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_ViewProjM[1].xyw;
    u_xlat0.xyw = hlslcc_mtx4x4_ViewProjM[0].xyw * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_ViewProjM[2].xyw * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_ViewProjM[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat0.xy = (-u_xlat0.xy) + u_xlat1.xy;
    u_xlat8.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat12 = float(1.0) / float(u_xlat8.x);
    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
    u_xlat12 = min(u_xlat8.x, _Clamp);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0<u_xlat8.x);
#else
    u_xlatb8 = 0.0<u_xlat8.x;
#endif
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat12);
    u_xlat0.xy = bool(u_xlatb8) ? u_xlat0.xy : vec2(0.0, 0.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_Intensity);
    u_xlat8.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat8.x = dot(u_xlat8.xy, vec2(0.0671105608, 0.00583714992));
    u_xlat8.x = fract(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * 52.9829178;
    u_xlat8.x = fract(u_xlat8.x);
    u_xlat12 = u_xlat8.x * 0.25;
    u_xlat1.xy = u_xlat8.xx + vec2(-0.5, 1.0);
    u_xlat8.xy = vec2(u_xlat12) * u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat8.xy).xyz;
    u_xlat3 = (-u_xlat1.xxxx) + vec4(0.5, 0.5, 1.5, 1.5);
    u_xlat8.x = u_xlat1.y * 0.25;
    u_xlat8.xy = u_xlat8.xx * u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat8.xy).xyz;
    u_xlat3 = u_xlat3 * vec4(0.25, 0.25, 0.25, 0.25);
    u_xlat0 = (-u_xlat3) * u_xlat0.xyxy + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat10_1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScaleBias;
out highp vec4 vs_TEXCOORD0;
vec2 u_xlat0;
int u_xlati0;
uvec2 u_xlatu0;
vec3 u_xlat1;
int u_xlati4;
void main()
{
    u_xlati0 = int(uint(uint(gl_VertexID) & 1u));
    u_xlatu0.y = uint(uint(gl_VertexID) >> 1u);
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.xz = vec2(u_xlatu0.yx);
    vs_TEXCOORD0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati0 = u_xlati4 + 1;
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.y = float(u_xlatu0.x);
    u_xlat0.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.xy = u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    gl_Position.zw = vec2(-1.0, 1.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4_ViewProjM[4];
uniform 	vec4 hlslcc_mtx4x4_PrevViewProjM[4];
uniform 	float _Intensity;
uniform 	float _Clamp;
uniform 	vec4 _SourceSize;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _SourceTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec3 u_xlat10_2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.zw * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat10_1.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.x = u_xlat10_1.x * 2.0 + -1.0;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.0, 1.0, -1.0);
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_PrevViewProjM[1].xyw;
    u_xlat1.xyz = hlslcc_mtx4x4_PrevViewProjM[0].xyw * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PrevViewProjM[2].xyw * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4_PrevViewProjM[3].xyw;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.zz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_ViewProjM[1].xyw;
    u_xlat0.xyw = hlslcc_mtx4x4_ViewProjM[0].xyw * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_ViewProjM[2].xyw * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_ViewProjM[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat0.xy = (-u_xlat0.xy) + u_xlat1.xy;
    u_xlat8.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat12 = float(1.0) / float(u_xlat8.x);
    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
    u_xlat12 = min(u_xlat8.x, _Clamp);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0<u_xlat8.x);
#else
    u_xlatb8 = 0.0<u_xlat8.x;
#endif
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat12);
    u_xlat0.xy = bool(u_xlatb8) ? u_xlat0.xy : vec2(0.0, 0.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_Intensity);
    u_xlat8.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat8.x = dot(u_xlat8.xy, vec2(0.0671105608, 0.00583714992));
    u_xlat8.x = fract(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * 52.9829178;
    u_xlat8.x = fract(u_xlat8.x);
    u_xlat12 = u_xlat8.x * 0.25;
    u_xlat1.xy = u_xlat8.xx + vec2(-0.5, 1.0);
    u_xlat8.xy = vec2(u_xlat12) * u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat8.xy).xyz;
    u_xlat3 = (-u_xlat1.xxxx) + vec4(0.5, 0.5, 1.5, 1.5);
    u_xlat8.x = u_xlat1.y * 0.25;
    u_xlat8.xy = u_xlat8.xx * u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat8.xy).xyz;
    u_xlat3 = u_xlat3 * vec4(0.25, 0.25, 0.25, 0.25);
    u_xlat0 = (-u_xlat3) * u_xlat0.xyxy + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat10_1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
}
 Pass {
  Name "Camera Motion Blur - Medium Quality"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 110743
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zz + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4_ViewProjM[4];
uniform 	vec4 hlslcc_mtx4x4_PrevViewProjM[4];
uniform 	float _Intensity;
uniform 	float _Clamp;
uniform 	vec4 _SourceSize;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _SourceTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec3 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat10_4;
vec2 u_xlat10;
bool u_xlatb10;
float u_xlat15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.zw * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat10_1.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.x = u_xlat10_1.x * 2.0 + -1.0;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.0, 1.0, -1.0);
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_PrevViewProjM[1].xyw;
    u_xlat1.xyz = hlslcc_mtx4x4_PrevViewProjM[0].xyw * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PrevViewProjM[2].xyw * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4_PrevViewProjM[3].xyw;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.zz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_ViewProjM[1].xyw;
    u_xlat0.xyw = hlslcc_mtx4x4_ViewProjM[0].xyw * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_ViewProjM[2].xyw * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_ViewProjM[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat0.xy = (-u_xlat0.xy) + u_xlat1.xy;
    u_xlat10.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat15 = float(1.0) / float(u_xlat10.x);
    u_xlat0.xy = vec2(u_xlat15) * u_xlat0.xy;
    u_xlat15 = min(u_xlat10.x, _Clamp);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(0.0<u_xlat10.x);
#else
    u_xlatb10 = 0.0<u_xlat10.x;
#endif
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat15);
    u_xlat0.xy = bool(u_xlatb10) ? u_xlat0.xy : vec2(0.0, 0.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_Intensity);
    u_xlat10.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat10.x = dot(u_xlat10.xy, vec2(0.0671105608, 0.00583714992));
    u_xlat10.x = fract(u_xlat10.x);
    u_xlat10.x = u_xlat10.x * 52.9829178;
    u_xlat10.x = fract(u_xlat10.x);
    u_xlat15 = u_xlat10.x * 0.166666672;
    u_xlat1.xyz = u_xlat10.xxx + vec3(-0.5, 1.0, 2.0);
    u_xlat10.xy = vec2(u_xlat15) * u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat10.xy).xyz;
    u_xlat3.xyz = (-u_xlat1.xxx) + vec3(0.5, 1.5, 2.5);
    u_xlat1 = u_xlat1.yyzz * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
    u_xlat1 = u_xlat1 * u_xlat0.xyxy + vs_TEXCOORD0.xyxy;
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.166666672, 0.166666672, 0.166666672);
    u_xlat4 = (-u_xlat3.xxyy) * u_xlat0.xyxy + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = (-u_xlat3.zz) * u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat4.xy).xyz;
    u_xlat10_4.xyz = texture(_SourceTex, u_xlat4.zw).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat10_4.xyz + u_xlat2.xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat1.zw).xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat10_3.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat10_1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.166666672, 0.166666672, 0.166666672);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScaleBias;
out highp vec4 vs_TEXCOORD0;
vec2 u_xlat0;
int u_xlati0;
uvec2 u_xlatu0;
vec3 u_xlat1;
int u_xlati4;
void main()
{
    u_xlati0 = int(uint(uint(gl_VertexID) & 1u));
    u_xlatu0.y = uint(uint(gl_VertexID) >> 1u);
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.xz = vec2(u_xlatu0.yx);
    vs_TEXCOORD0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati0 = u_xlati4 + 1;
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.y = float(u_xlatu0.x);
    u_xlat0.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.xy = u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    gl_Position.zw = vec2(-1.0, 1.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4_ViewProjM[4];
uniform 	vec4 hlslcc_mtx4x4_PrevViewProjM[4];
uniform 	float _Intensity;
uniform 	float _Clamp;
uniform 	vec4 _SourceSize;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _SourceTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec3 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat10_4;
vec2 u_xlat10;
bool u_xlatb10;
float u_xlat15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.zw * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat10_1.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.x = u_xlat10_1.x * 2.0 + -1.0;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.0, 1.0, -1.0);
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_PrevViewProjM[1].xyw;
    u_xlat1.xyz = hlslcc_mtx4x4_PrevViewProjM[0].xyw * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PrevViewProjM[2].xyw * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4_PrevViewProjM[3].xyw;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.zz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_ViewProjM[1].xyw;
    u_xlat0.xyw = hlslcc_mtx4x4_ViewProjM[0].xyw * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_ViewProjM[2].xyw * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_ViewProjM[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat0.xy = (-u_xlat0.xy) + u_xlat1.xy;
    u_xlat10.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat15 = float(1.0) / float(u_xlat10.x);
    u_xlat0.xy = vec2(u_xlat15) * u_xlat0.xy;
    u_xlat15 = min(u_xlat10.x, _Clamp);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(0.0<u_xlat10.x);
#else
    u_xlatb10 = 0.0<u_xlat10.x;
#endif
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat15);
    u_xlat0.xy = bool(u_xlatb10) ? u_xlat0.xy : vec2(0.0, 0.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_Intensity);
    u_xlat10.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat10.x = dot(u_xlat10.xy, vec2(0.0671105608, 0.00583714992));
    u_xlat10.x = fract(u_xlat10.x);
    u_xlat10.x = u_xlat10.x * 52.9829178;
    u_xlat10.x = fract(u_xlat10.x);
    u_xlat15 = u_xlat10.x * 0.166666672;
    u_xlat1.xyz = u_xlat10.xxx + vec3(-0.5, 1.0, 2.0);
    u_xlat10.xy = vec2(u_xlat15) * u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat10.xy).xyz;
    u_xlat3.xyz = (-u_xlat1.xxx) + vec3(0.5, 1.5, 2.5);
    u_xlat1 = u_xlat1.yyzz * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
    u_xlat1 = u_xlat1 * u_xlat0.xyxy + vs_TEXCOORD0.xyxy;
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.166666672, 0.166666672, 0.166666672);
    u_xlat4 = (-u_xlat3.xxyy) * u_xlat0.xyxy + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = (-u_xlat3.zz) * u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat4.xy).xyz;
    u_xlat10_4.xyz = texture(_SourceTex, u_xlat4.zw).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat10_4.xyz + u_xlat2.xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat1.zw).xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat10_3.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat10_1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.166666672, 0.166666672, 0.166666672);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
}
 Pass {
  Name "Camera Motion Blur - High Quality"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 174197
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zz + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4_ViewProjM[4];
uniform 	vec4 hlslcc_mtx4x4_PrevViewProjM[4];
uniform 	float _Intensity;
uniform 	float _Clamp;
uniform 	vec4 _SourceSize;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _SourceTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec3 u_xlat10_2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat10_4;
mediump vec3 u_xlat10_5;
vec2 u_xlat12;
bool u_xlatb12;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.zw * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat10_1.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.x = u_xlat10_1.x * 2.0 + -1.0;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.0, 1.0, -1.0);
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_PrevViewProjM[1].xyw;
    u_xlat1.xyz = hlslcc_mtx4x4_PrevViewProjM[0].xyw * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PrevViewProjM[2].xyw * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4_PrevViewProjM[3].xyw;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.zz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_ViewProjM[1].xyw;
    u_xlat0.xyw = hlslcc_mtx4x4_ViewProjM[0].xyw * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_ViewProjM[2].xyw * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_ViewProjM[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat0.xy = (-u_xlat0.xy) + u_xlat1.xy;
    u_xlat12.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat18 = float(1.0) / float(u_xlat12.x);
    u_xlat0.xy = vec2(u_xlat18) * u_xlat0.xy;
    u_xlat18 = min(u_xlat12.x, _Clamp);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0<u_xlat12.x);
#else
    u_xlatb12 = 0.0<u_xlat12.x;
#endif
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat18);
    u_xlat0.xy = bool(u_xlatb12) ? u_xlat0.xy : vec2(0.0, 0.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_Intensity);
    u_xlat12.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat12.x = dot(u_xlat12.xy, vec2(0.0671105608, 0.00583714992));
    u_xlat12.x = fract(u_xlat12.x);
    u_xlat12.x = u_xlat12.x * 52.9829178;
    u_xlat12.x = fract(u_xlat12.x);
    u_xlat18 = u_xlat12.x * 0.125;
    u_xlat1 = u_xlat12.xxxx + vec4(-0.5, 1.0, 2.0, 3.0);
    u_xlat12.xy = vec2(u_xlat18) * u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat12.xy).xyz;
    u_xlat3 = (-u_xlat1.xxxx) + vec4(0.5, 1.5, 2.5, 3.5);
    u_xlat1.xyz = u_xlat1.yzw * vec3(0.125, 0.125, 0.125);
    u_xlat3 = u_xlat3 * vec4(0.125, 0.125, 0.125, 0.125);
    u_xlat4 = (-u_xlat3.xxyy) * u_xlat0.xyxy + vs_TEXCOORD0.xyxy;
    u_xlat3 = (-u_xlat3.zzww) * u_xlat0.xyxy + vs_TEXCOORD0.xyxy;
    u_xlat10_5.xyz = texture(_SourceTex, u_xlat4.xy).xyz;
    u_xlat10_4.xyz = texture(_SourceTex, u_xlat4.zw).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz + u_xlat10_5.xyz;
    u_xlat2.xyz = u_xlat10_4.xyz + u_xlat2.xyz;
    u_xlat4 = u_xlat1.xxyy * u_xlat0.xyxy + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat1.zz * u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat4.xy).xyz;
    u_xlat10_4.xyz = texture(_SourceTex, u_xlat4.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz + u_xlat2.xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat3.xy).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat3.zw).xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat10_2.xyz;
    u_xlat1.xyz = u_xlat10_4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat10_3.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.125, 0.125, 0.125);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScaleBias;
out highp vec4 vs_TEXCOORD0;
vec2 u_xlat0;
int u_xlati0;
uvec2 u_xlatu0;
vec3 u_xlat1;
int u_xlati4;
void main()
{
    u_xlati0 = int(uint(uint(gl_VertexID) & 1u));
    u_xlatu0.y = uint(uint(gl_VertexID) >> 1u);
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.xz = vec2(u_xlatu0.yx);
    vs_TEXCOORD0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati0 = u_xlati4 + 1;
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.y = float(u_xlatu0.x);
    u_xlat0.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.xy = u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    gl_Position.zw = vec2(-1.0, 1.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4_ViewProjM[4];
uniform 	vec4 hlslcc_mtx4x4_PrevViewProjM[4];
uniform 	float _Intensity;
uniform 	float _Clamp;
uniform 	vec4 _SourceSize;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _SourceTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec3 u_xlat10_2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat10_4;
mediump vec3 u_xlat10_5;
vec2 u_xlat12;
bool u_xlatb12;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.zw * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat10_1.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.x = u_xlat10_1.x * 2.0 + -1.0;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.0, 1.0, -1.0);
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_PrevViewProjM[1].xyw;
    u_xlat1.xyz = hlslcc_mtx4x4_PrevViewProjM[0].xyw * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PrevViewProjM[2].xyw * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4_PrevViewProjM[3].xyw;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.zz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_ViewProjM[1].xyw;
    u_xlat0.xyw = hlslcc_mtx4x4_ViewProjM[0].xyw * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_ViewProjM[2].xyw * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_ViewProjM[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat0.xy = (-u_xlat0.xy) + u_xlat1.xy;
    u_xlat12.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat18 = float(1.0) / float(u_xlat12.x);
    u_xlat0.xy = vec2(u_xlat18) * u_xlat0.xy;
    u_xlat18 = min(u_xlat12.x, _Clamp);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0<u_xlat12.x);
#else
    u_xlatb12 = 0.0<u_xlat12.x;
#endif
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat18);
    u_xlat0.xy = bool(u_xlatb12) ? u_xlat0.xy : vec2(0.0, 0.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_Intensity);
    u_xlat12.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat12.x = dot(u_xlat12.xy, vec2(0.0671105608, 0.00583714992));
    u_xlat12.x = fract(u_xlat12.x);
    u_xlat12.x = u_xlat12.x * 52.9829178;
    u_xlat12.x = fract(u_xlat12.x);
    u_xlat18 = u_xlat12.x * 0.125;
    u_xlat1 = u_xlat12.xxxx + vec4(-0.5, 1.0, 2.0, 3.0);
    u_xlat12.xy = vec2(u_xlat18) * u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat12.xy).xyz;
    u_xlat3 = (-u_xlat1.xxxx) + vec4(0.5, 1.5, 2.5, 3.5);
    u_xlat1.xyz = u_xlat1.yzw * vec3(0.125, 0.125, 0.125);
    u_xlat3 = u_xlat3 * vec4(0.125, 0.125, 0.125, 0.125);
    u_xlat4 = (-u_xlat3.xxyy) * u_xlat0.xyxy + vs_TEXCOORD0.xyxy;
    u_xlat3 = (-u_xlat3.zzww) * u_xlat0.xyxy + vs_TEXCOORD0.xyxy;
    u_xlat10_5.xyz = texture(_SourceTex, u_xlat4.xy).xyz;
    u_xlat10_4.xyz = texture(_SourceTex, u_xlat4.zw).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz + u_xlat10_5.xyz;
    u_xlat2.xyz = u_xlat10_4.xyz + u_xlat2.xyz;
    u_xlat4 = u_xlat1.xxyy * u_xlat0.xyxy + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat1.zz * u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat4.xy).xyz;
    u_xlat10_4.xyz = texture(_SourceTex, u_xlat4.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz + u_xlat2.xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat3.xy).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat3.zw).xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat10_2.xyz;
    u_xlat1.xyz = u_xlat10_4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat10_3.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.125, 0.125, 0.125);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
}
}
}