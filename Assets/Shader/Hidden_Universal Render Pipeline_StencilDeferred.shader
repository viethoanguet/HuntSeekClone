//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Universal Render Pipeline/StencilDeferred" {
Properties {
_StencilRef ("StencilRef", Float) = 0
_StencilReadMask ("StencilReadMask", Float) = 0
_StencilWriteMask ("StencilWriteMask", Float) = 0
_LitPunctualStencilRef ("LitPunctualStencilWriteMask", Float) = 0
_LitPunctualStencilReadMask ("LitPunctualStencilReadMask", Float) = 0
_LitPunctualStencilWriteMask ("LitPunctualStencilWriteMask", Float) = 0
_SimpleLitPunctualStencilRef ("SimpleLitPunctualStencilWriteMask", Float) = 0
_SimpleLitPunctualStencilReadMask ("SimpleLitPunctualStencilReadMask", Float) = 0
_SimpleLitPunctualStencilWriteMask ("SimpleLitPunctualStencilWriteMask", Float) = 0
_LitDirStencilRef ("LitDirStencilRef", Float) = 0
_LitDirStencilReadMask ("LitDirStencilReadMask", Float) = 0
_LitDirStencilWriteMask ("LitDirStencilWriteMask", Float) = 0
_SimpleLitDirStencilRef ("SimpleLitDirStencilRef", Float) = 0
_SimpleLitDirStencilReadMask ("SimpleLitDirStencilReadMask", Float) = 0
_SimpleLitDirStencilWriteMask ("SimpleLitDirStencilWriteMask", Float) = 0
_ClearStencilRef ("ClearStencilRef", Float) = 0
_ClearStencilReadMask ("ClearStencilReadMask", Float) = 0
_ClearStencilWriteMask ("ClearStencilWriteMask", Float) = 0
}
SubShader {
 Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
 Pass {
  Name "Stencil Volume"
  Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  ColorMask 0 0
  ZClip Off
  ZWrite Off
  Cull Off
  Stencil {
   ReadMask 0
   WriteMask 0
   CompFront NotEqual
   PassFront Keep
   FailFront Keep
   ZFailFront Invert
   CompBack NotEqual
   PassBack Keep
   FailBack Keep
   ZFailBack Invert
  }
  GpuProgramID 30399
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
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.z = u_xlat0.w;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(1.0, 1.0, 1.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_SPOT" }
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
uniform 	vec4 _SpotLightScale;
uniform 	vec4 _SpotLightBias;
uniform 	vec4 _SpotLightGuard;
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
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xyz = _SpotLightScale.xyz * in_POSITION0.xyz + _SpotLightBias.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = _SpotLightGuard.w;
    u_xlat0.xyz = u_xlat0.xyz * _SpotLightScale.www + (-u_xlat1.yyz);
    u_xlat0.xyz = u_xlat0.xyz * _SpotLightGuard.xyz + u_xlat1.xyz;
    u_xlat6 = dot(in_POSITION0.xyz, in_POSITION0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6!=0.0);
#else
    u_xlatb6 = u_xlat6!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb6)) ? u_xlat0.xyz : in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.z = u_xlat0.w;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(1.0, 1.0, 1.0, 1.0);
    return;
}

#endif
"
}
}
}
 Pass {
  Name "Deferred Punctual Light (Lit)"
  Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  Blend One One, Zero One
  ZClip Off
  ZTest GEqual
  ZWrite Off
  Cull Front
  Stencil {
   ReadMask 0
   WriteMask 0
   Comp Equal
   Pass Zero
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 117878
Program "vp" {
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_LIT" "_POINT" }
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
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.z = u_xlat0.w;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	vec3 _LightPosWS;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec4 _LightAttenuation;
uniform 	mediump vec3 _LightDirection;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec2 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
mediump float u_xlat16_10;
float u_xlat13;
mediump float u_xlat10_13;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
mediump float u_xlat16_22;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat0;
    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_13 = textureLod(_CameraDepthTexture, u_xlat1.xy, 0.0).x;
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_13) + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat18 = float(1.0) / float(u_xlat0.w);
    u_xlat2.xyz = (-u_xlat0.xyz) * vec3(u_xlat18) + _WorldSpaceCameraPos.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat18) + _LightPosWS.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb18 = unity_OrthoParams.w==0.0;
#endif
    u_xlat3.x = (u_xlatb18) ? u_xlat2.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat3.y = (u_xlatb18) ? u_xlat2.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat3.z = (u_xlatb18) ? u_xlat2.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_4.x = inversesqrt(u_xlat18);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 6.10351562e-05);
    u_xlat13 = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat13);
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = max(u_xlat13, 1.17549435e-38);
    u_xlat16_4.x = inversesqrt(u_xlat13);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_4.xxx;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat1.xy, 0.0);
    u_xlat16_4.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xxx;
    u_xlat13 = u_xlat10_3.w * 0.5 + 0.5;
    u_xlat16_22 = (-u_xlat13) + 1.0;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_22 = max(u_xlat16_22, 0.0078125);
    u_xlat13 = dot(u_xlat16_4.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13 = min(max(u_xlat13, 0.0), 1.0);
#else
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
#endif
    u_xlat19 = dot(u_xlat0.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat19 * u_xlat19;
    u_xlat19 = max(u_xlat16_5.x, 0.100000001);
    u_xlat16_4.x = dot(u_xlat16_4.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_10 = dot(_LightDirection.xyz, u_xlat0.xyz);
    u_xlat16_10 = u_xlat16_10 * _LightAttenuation.z + _LightAttenuation.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10 = min(max(u_xlat16_10, 0.0), 1.0);
#else
    u_xlat16_10 = clamp(u_xlat16_10, 0.0, 1.0);
#endif
    u_xlat16_10 = u_xlat16_10 * u_xlat16_10;
    u_xlat0.x = u_xlat13 * u_xlat13;
    u_xlat6 = u_xlat16_22 * u_xlat16_22 + -1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6 + 1.00001001;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat19 * u_xlat0.x;
    u_xlat6 = u_xlat16_22 * 4.0 + 2.0;
    u_xlat16_16 = u_xlat16_22 * u_xlat16_22;
    u_xlat0.x = u_xlat6 * u_xlat0.x;
    u_xlat0.x = u_xlat16_16 / u_xlat0.x;
    u_xlat16_16 = u_xlat0.x + -6.10351562e-05;
    u_xlat16_16 = max(u_xlat16_16, 0.0);
    u_xlat16_16 = min(u_xlat16_16, 100.0);
    u_xlat10_0.xyz = textureLod(_GBuffer0, u_xlat1.xy, 0.0).xyz;
    u_xlat10_1.xyz = textureLod(_GBuffer1, u_xlat1.xy, 0.0).xyz;
    u_xlat16_5.xyz = u_xlat10_1.xyz * vec3(u_xlat16_16) + u_xlat10_0.xyz;
    u_xlat0.x = float(1.0) / float(u_xlat18);
    u_xlat6 = u_xlat18 * _LightAttenuation.x + _LightAttenuation.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat6 * u_xlat0.x;
    u_xlat0.x = u_xlat16_10 * u_xlat0.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat0.x;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _LightColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DEFERRED_SUBTRACTIVE_LIGHTING" "_LIT" "_POINT" }
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
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.z = u_xlat0.w;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
vec4 ImmCB_0[4];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	vec3 _LightPosWS;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec4 _LightAttenuation;
uniform 	mediump vec3 _LightDirection;
uniform 	mediump vec4 _LightOcclusionProbInfo;
uniform 	int _LightFlags;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer4;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
mediump vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
float u_xlat8;
mediump float u_xlat16_15;
float u_xlat16;
mediump float u_xlat10_16;
int u_xlati16;
uint u_xlatu16;
bool u_xlatb16;
mediump float u_xlat16_23;
float u_xlat24;
float u_xlat25;
int u_xlati25;
bool u_xlatb25;
float u_xlat26;
mediump float u_xlat16_30;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat16 = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu16 = uint(u_xlat16);
    u_xlati16 = int(uint(u_xlatu16 & uint(_LightFlags)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlati16==4);
#else
    u_xlatb16 = u_xlati16==4;
#endif
    if(u_xlatb16){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat10_16 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat10_4 = textureLod(_GBuffer4, u_xlat0.xy, 0.0);
    u_xlat5 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat5 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat5;
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_16) + u_xlat5;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat24 = float(1.0) / float(u_xlat0.w);
    u_xlat16_6.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat10_3.xyz * u_xlat16_6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb25 = unity_OrthoParams.w==0.0;
#endif
    u_xlat3.xyz = (-u_xlat0.xyz) * vec3(u_xlat24) + _WorldSpaceCameraPos.xyz;
    u_xlat5.x = (u_xlatb25) ? u_xlat3.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = (u_xlatb25) ? u_xlat3.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = (u_xlatb25) ? u_xlat3.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat25 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat25 = max(u_xlat25, 1.17549435e-38);
    u_xlat16_30 = inversesqrt(u_xlat25);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat24) + _LightPosWS.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 6.10351562e-05);
    u_xlat25 = inversesqrt(u_xlat24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat25);
    u_xlat25 = float(1.0) / float(u_xlat24);
    u_xlat24 = u_xlat24 * _LightAttenuation.x + _LightAttenuation.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat24 = u_xlat24 * u_xlat25;
    u_xlat16_7.x = dot(_LightDirection.xyz, u_xlat0.xyz);
    u_xlat16_7.x = u_xlat16_7.x * _LightAttenuation.z + _LightAttenuation.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat24 = u_xlat24 * u_xlat16_7.x;
    u_xlati25 = int(_LightOcclusionProbInfo.x);
    u_xlat16_7.x = dot(u_xlat10_4, ImmCB_0[u_xlati25]);
    u_xlat16_7.x = max(u_xlat16_7.x, _LightOcclusionProbInfo.y);
    u_xlat16_7.x = u_xlat24 * u_xlat16_7.x;
    u_xlat24 = u_xlat10_3.w * 0.5 + 0.5;
    u_xlat16_15 = (-u_xlat24) + 1.0;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat16_15 = max(u_xlat16_15, 0.0078125);
    u_xlat16_23 = u_xlat16_15 * u_xlat16_15;
    u_xlat24 = u_xlat16_15 * 4.0 + 2.0;
    u_xlat25 = u_xlat16_15 * u_xlat16_15 + -1.0;
    u_xlat16_15 = dot(u_xlat16_6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15 = min(max(u_xlat16_15, 0.0), 1.0);
#else
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_15 * u_xlat16_7.x;
    u_xlat16_7.xyw = u_xlat16_7.xxx * _LightColor.xyz;
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat16_30) + u_xlat0.xyz;
    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat26 = max(u_xlat26, 1.17549435e-38);
    u_xlat16_30 = inversesqrt(u_xlat26);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_30);
    u_xlat26 = dot(u_xlat16_6.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8 = u_xlat26 * u_xlat26;
    u_xlat8 = u_xlat8 * u_xlat25 + 1.00001001;
    u_xlat16_6.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat8 * u_xlat8;
    u_xlat8 = max(u_xlat16_6.x, 0.100000001);
    u_xlat0.x = u_xlat8 * u_xlat0.x;
    u_xlat0.x = u_xlat24 * u_xlat0.x;
    u_xlat0.x = u_xlat16_23 / u_xlat0.x;
    u_xlat16_6.x = u_xlat0.x + -6.10351562e-05;
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = min(u_xlat16_6.x, 100.0);
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat16_6.xxx + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_7.xyw * u_xlat16_6.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_GBUFFER_NORMALS_OCT" "_LIT" "_POINT" }
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
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.z = u_xlat0.w;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	vec3 _LightPosWS;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec4 _LightAttenuation;
uniform 	mediump vec3 _LightDirection;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat10_0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
uvec3 u_xlatu1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
ivec2 u_xlati3;
bvec2 u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat7;
float u_xlat8;
mediump float u_xlat16_9;
vec2 u_xlat14;
mediump float u_xlat10_14;
uvec2 u_xlatu14;
bool u_xlatb14;
mediump float u_xlat16_16;
float u_xlat21;
float u_xlat22;
mediump float u_xlat16_23;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(255.5, 255.5, 255.5);
    u_xlat16_2.x = (-u_xlat10_1.w) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlatu1.xyz = uvec3(u_xlat1.xyz);
    u_xlatu14.x = uint(u_xlatu1.z >> 4u);
    u_xlati3.y = int(int(u_xlatu14.x) << 8);
    u_xlati3.x = int(int_bitfieldInsert(0,int(u_xlatu1.z),8,4) );
    u_xlatu14.xy = uvec2(u_xlatu1.x | uint(u_xlati3.x), u_xlatu1.y | uint(u_xlati3.y));
    u_xlat14.xy = vec2(u_xlatu14.xy);
    u_xlat14.xy = u_xlat14.xy * vec2(0.000488400517, 0.000488400517) + vec2(-1.0, -1.0);
    u_xlat1.x = -abs(u_xlat14.x) + 1.0;
    u_xlat1.z = -abs(u_xlat14.y) + u_xlat1.x;
    u_xlat22 = max((-u_xlat1.z), 0.0);
    u_xlatb3.xy = greaterThanEqual(u_xlat14.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat3.x = (u_xlatb3.x) ? (-float(u_xlat22)) : float(u_xlat22);
    u_xlat3.y = (u_xlatb3.y) ? (-float(u_xlat22)) : float(u_xlat22);
    u_xlat1.xy = u_xlat14.xy + u_xlat3.xy;
    u_xlat14.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat1.xyz;
    u_xlat3 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat3 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat3;
    u_xlat10_14 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat3 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_14) + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat14.x = float(1.0) / float(u_xlat3.w);
    u_xlat4.xyz = (-u_xlat3.xyz) * u_xlat14.xxx + _WorldSpaceCameraPos.xyz;
    u_xlat3.xyz = (-u_xlat3.xyz) * u_xlat14.xxx + _LightPosWS.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb14 = unity_OrthoParams.w==0.0;
#endif
    u_xlat5.x = (u_xlatb14) ? u_xlat4.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = (u_xlatb14) ? u_xlat4.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = (u_xlatb14) ? u_xlat4.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat14.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat14.x = max(u_xlat14.x, 1.17549435e-38);
    u_xlat16_9 = inversesqrt(u_xlat14.x);
    u_xlat14.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat14.x = max(u_xlat14.x, 6.10351562e-05);
    u_xlat21 = inversesqrt(u_xlat14.x);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat16_9) + u_xlat3.xyz;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat16_9 = inversesqrt(u_xlat21);
    u_xlat4.xyz = vec3(u_xlat16_9) * u_xlat4.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_9 = dot(u_xlat1.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9 = min(max(u_xlat16_9, 0.0), 1.0);
#else
    u_xlat16_9 = clamp(u_xlat16_9, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_16 = dot(_LightDirection.xyz, u_xlat3.xyz);
    u_xlat16_16 = u_xlat16_16 * _LightAttenuation.z + _LightAttenuation.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16 = min(max(u_xlat16_16, 0.0), 1.0);
#else
    u_xlat16_16 = clamp(u_xlat16_16, 0.0, 1.0);
#endif
    u_xlat16_16 = u_xlat16_16 * u_xlat16_16;
    u_xlat16_23 = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat16_23, 0.100000001);
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat8 = u_xlat16_2.x * u_xlat16_2.x + -1.0;
    u_xlat21 = u_xlat21 * u_xlat8 + 1.00001001;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat1.x * u_xlat21;
    u_xlat1.x = u_xlat16_2.x * 4.0 + 2.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat21 = u_xlat16_2.x / u_xlat21;
    u_xlat16_2.x = u_xlat21 + -6.10351562e-05;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.x = min(u_xlat16_2.x, 100.0);
    u_xlat10_1.xyz = textureLod(_GBuffer0, u_xlat0.xy, 0.0).xyz;
    u_xlat10_0.xyw = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat16_6.xyz = u_xlat10_0.xyw * u_xlat16_2.xxx + u_xlat10_1.xyz;
    u_xlat0.x = float(1.0) / float(u_xlat14.x);
    u_xlat7 = u_xlat14.x * _LightAttenuation.x + _LightAttenuation.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.x = u_xlat16_16 * u_xlat0.x;
    u_xlat16_2.x = u_xlat16_9 * u_xlat0.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DEFERRED_SUBTRACTIVE_LIGHTING" "_GBUFFER_NORMALS_OCT" "_LIT" "_POINT" }
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
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.z = u_xlat0.w;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
vec4 ImmCB_0[4];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	vec3 _LightPosWS;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec4 _LightAttenuation;
uniform 	mediump vec3 _LightDirection;
uniform 	mediump vec4 _LightOcclusionProbInfo;
uniform 	int _LightFlags;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer4;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
uvec3 u_xlatu3;
vec3 u_xlat4;
mediump vec4 u_xlat10_4;
vec4 u_xlat5;
ivec2 u_xlati5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_16;
float u_xlat18;
mediump float u_xlat10_18;
int u_xlati18;
uint u_xlatu18;
bool u_xlatb18;
mediump float u_xlat16_25;
float u_xlat27;
float u_xlat28;
int u_xlati28;
uint u_xlatu28;
bool u_xlatb28;
float u_xlat29;
mediump float u_xlat16_34;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat18 = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu18 = uint(u_xlat18);
    u_xlati18 = int(uint(u_xlatu18 & uint(_LightFlags)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlati18==4);
#else
    u_xlatb18 = u_xlati18==4;
#endif
    if(u_xlatb18){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat10_18 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat10_4 = textureLod(_GBuffer4, u_xlat0.xy, 0.0);
    u_xlat5 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat5 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat5;
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_18) + u_xlat5;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat27 = float(1.0) / float(u_xlat0.w);
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(255.5, 255.5, 255.5);
    u_xlatu3.xyz = uvec3(u_xlat3.xyz);
    u_xlatu28 = uint(u_xlatu3.z >> 4u);
    u_xlati5.x = int(int_bitfieldInsert(0,int(u_xlatu3.z),8,4) );
    u_xlati5.y = int(int(u_xlatu28) << 8);
    u_xlatu3.xy = uvec2(u_xlatu3.x | uint(u_xlati5.x), u_xlatu3.y | uint(u_xlati5.y));
    u_xlat3.xy = vec2(u_xlatu3.xy);
    u_xlat3.xy = u_xlat3.xy * vec2(0.000488400517, 0.000488400517) + vec2(-1.0, -1.0);
    u_xlat28 = -abs(u_xlat3.x) + 1.0;
    u_xlat5.z = -abs(u_xlat3.y) + u_xlat28;
    u_xlat28 = max((-u_xlat5.z), 0.0);
    u_xlatb6.xy = greaterThanEqual(u_xlat3.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat6.x = (u_xlatb6.x) ? (-float(u_xlat28)) : float(u_xlat28);
    u_xlat6.y = (u_xlatb6.y) ? (-float(u_xlat28)) : float(u_xlat28);
    u_xlat5.xy = u_xlat3.xy + u_xlat6.xy;
    u_xlat28 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb28 = unity_OrthoParams.w==0.0;
#endif
    u_xlat5.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = (u_xlatb28) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = (u_xlatb28) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = (u_xlatb28) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat28 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat28 = max(u_xlat28, 1.17549435e-38);
    u_xlat16_7.x = inversesqrt(u_xlat28);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + _LightPosWS.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 6.10351562e-05);
    u_xlat28 = inversesqrt(u_xlat27);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat28);
    u_xlat28 = float(1.0) / float(u_xlat27);
    u_xlat27 = u_xlat27 * _LightAttenuation.x + _LightAttenuation.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat27 * u_xlat28;
    u_xlat16_16 = dot(_LightDirection.xyz, u_xlat0.xyz);
    u_xlat16_16 = u_xlat16_16 * _LightAttenuation.z + _LightAttenuation.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16 = min(max(u_xlat16_16, 0.0), 1.0);
#else
    u_xlat16_16 = clamp(u_xlat16_16, 0.0, 1.0);
#endif
    u_xlat16_16 = u_xlat16_16 * u_xlat16_16;
    u_xlat27 = u_xlat27 * u_xlat16_16;
    u_xlati28 = int(_LightOcclusionProbInfo.x);
    u_xlat16_16 = dot(u_xlat10_4, ImmCB_0[u_xlati28]);
    u_xlat16_16 = max(u_xlat16_16, _LightOcclusionProbInfo.y);
    u_xlat16_16 = u_xlat27 * u_xlat16_16;
    u_xlat16_25 = (-u_xlat10_3.w) + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = max(u_xlat16_25, 0.0078125);
    u_xlat16_34 = u_xlat16_25 * u_xlat16_25;
    u_xlat27 = u_xlat16_25 * 4.0 + 2.0;
    u_xlat28 = u_xlat16_25 * u_xlat16_25 + -1.0;
    u_xlat16_25 = dot(u_xlat3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat16_16 = u_xlat16_25 * u_xlat16_16;
    u_xlat16_8.xyz = vec3(u_xlat16_16) * _LightColor.xyz;
    u_xlat4.xyz = u_xlat6.xyz * u_xlat16_7.xxx + u_xlat0.xyz;
    u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat29 = max(u_xlat29, 1.17549435e-38);
    u_xlat16_7.x = inversesqrt(u_xlat29);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_7.xxx;
    u_xlat29 = dot(u_xlat3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat29 = min(max(u_xlat29, 0.0), 1.0);
#else
    u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat29 * u_xlat29;
    u_xlat9 = u_xlat9 * u_xlat28 + 1.00001001;
    u_xlat16_7.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat9 * u_xlat9;
    u_xlat9 = max(u_xlat16_7.x, 0.100000001);
    u_xlat0.x = u_xlat9 * u_xlat0.x;
    u_xlat0.x = u_xlat27 * u_xlat0.x;
    u_xlat0.x = u_xlat16_34 / u_xlat0.x;
    u_xlat16_7.x = u_xlat0.x + -6.10351562e-05;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_7.x = min(u_xlat16_7.x, 100.0);
    u_xlat16_7.xyz = u_xlat10_2.xyz * u_xlat16_7.xxx + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_8.xyz * u_xlat16_7.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DEFERRED_SUBTRACTIVE_LIGHTING" "_GBUFFER_NORMALS_OCT" "_LIT" "_SPOT" }
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
uniform 	vec4 _SpotLightScale;
uniform 	vec4 _SpotLightBias;
uniform 	vec4 _SpotLightGuard;
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
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xyz = _SpotLightScale.xyz * in_POSITION0.xyz + _SpotLightBias.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = _SpotLightGuard.w;
    u_xlat0.xyz = u_xlat0.xyz * _SpotLightScale.www + (-u_xlat1.yyz);
    u_xlat0.xyz = u_xlat0.xyz * _SpotLightGuard.xyz + u_xlat1.xyz;
    u_xlat6 = dot(in_POSITION0.xyz, in_POSITION0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6!=0.0);
#else
    u_xlatb6 = u_xlat6!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb6)) ? u_xlat0.xyz : in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.z = u_xlat0.w;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
vec4 ImmCB_0[4];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	vec3 _LightPosWS;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec4 _LightAttenuation;
uniform 	mediump vec3 _LightDirection;
uniform 	mediump vec4 _LightOcclusionProbInfo;
uniform 	int _LightFlags;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer4;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
uvec3 u_xlatu3;
vec3 u_xlat4;
mediump vec4 u_xlat10_4;
vec4 u_xlat5;
ivec2 u_xlati5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_16;
float u_xlat18;
mediump float u_xlat10_18;
int u_xlati18;
uint u_xlatu18;
bool u_xlatb18;
mediump float u_xlat16_25;
float u_xlat27;
float u_xlat28;
int u_xlati28;
uint u_xlatu28;
bool u_xlatb28;
float u_xlat29;
mediump float u_xlat16_34;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat18 = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu18 = uint(u_xlat18);
    u_xlati18 = int(uint(u_xlatu18 & uint(_LightFlags)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlati18==4);
#else
    u_xlatb18 = u_xlati18==4;
#endif
    if(u_xlatb18){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat10_18 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat10_4 = textureLod(_GBuffer4, u_xlat0.xy, 0.0);
    u_xlat5 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat5 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat5;
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_18) + u_xlat5;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat27 = float(1.0) / float(u_xlat0.w);
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(255.5, 255.5, 255.5);
    u_xlatu3.xyz = uvec3(u_xlat3.xyz);
    u_xlatu28 = uint(u_xlatu3.z >> 4u);
    u_xlati5.x = int(int_bitfieldInsert(0,int(u_xlatu3.z),8,4) );
    u_xlati5.y = int(int(u_xlatu28) << 8);
    u_xlatu3.xy = uvec2(u_xlatu3.x | uint(u_xlati5.x), u_xlatu3.y | uint(u_xlati5.y));
    u_xlat3.xy = vec2(u_xlatu3.xy);
    u_xlat3.xy = u_xlat3.xy * vec2(0.000488400517, 0.000488400517) + vec2(-1.0, -1.0);
    u_xlat28 = -abs(u_xlat3.x) + 1.0;
    u_xlat5.z = -abs(u_xlat3.y) + u_xlat28;
    u_xlat28 = max((-u_xlat5.z), 0.0);
    u_xlatb6.xy = greaterThanEqual(u_xlat3.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat6.x = (u_xlatb6.x) ? (-float(u_xlat28)) : float(u_xlat28);
    u_xlat6.y = (u_xlatb6.y) ? (-float(u_xlat28)) : float(u_xlat28);
    u_xlat5.xy = u_xlat3.xy + u_xlat6.xy;
    u_xlat28 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb28 = unity_OrthoParams.w==0.0;
#endif
    u_xlat5.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = (u_xlatb28) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = (u_xlatb28) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = (u_xlatb28) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat28 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat28 = max(u_xlat28, 1.17549435e-38);
    u_xlat16_7.x = inversesqrt(u_xlat28);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + _LightPosWS.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 6.10351562e-05);
    u_xlat28 = inversesqrt(u_xlat27);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat28);
    u_xlat28 = float(1.0) / float(u_xlat27);
    u_xlat27 = u_xlat27 * _LightAttenuation.x + _LightAttenuation.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat27 * u_xlat28;
    u_xlat16_16 = dot(_LightDirection.xyz, u_xlat0.xyz);
    u_xlat16_16 = u_xlat16_16 * _LightAttenuation.z + _LightAttenuation.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16 = min(max(u_xlat16_16, 0.0), 1.0);
#else
    u_xlat16_16 = clamp(u_xlat16_16, 0.0, 1.0);
#endif
    u_xlat16_16 = u_xlat16_16 * u_xlat16_16;
    u_xlat27 = u_xlat27 * u_xlat16_16;
    u_xlati28 = int(_LightOcclusionProbInfo.x);
    u_xlat16_16 = dot(u_xlat10_4, ImmCB_0[u_xlati28]);
    u_xlat16_16 = max(u_xlat16_16, _LightOcclusionProbInfo.y);
    u_xlat16_16 = u_xlat27 * u_xlat16_16;
    u_xlat16_25 = (-u_xlat10_3.w) + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = max(u_xlat16_25, 0.0078125);
    u_xlat16_34 = u_xlat16_25 * u_xlat16_25;
    u_xlat27 = u_xlat16_25 * 4.0 + 2.0;
    u_xlat28 = u_xlat16_25 * u_xlat16_25 + -1.0;
    u_xlat16_25 = dot(u_xlat3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat16_16 = u_xlat16_25 * u_xlat16_16;
    u_xlat16_8.xyz = vec3(u_xlat16_16) * _LightColor.xyz;
    u_xlat4.xyz = u_xlat6.xyz * u_xlat16_7.xxx + u_xlat0.xyz;
    u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat29 = max(u_xlat29, 1.17549435e-38);
    u_xlat16_7.x = inversesqrt(u_xlat29);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_7.xxx;
    u_xlat29 = dot(u_xlat3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat29 = min(max(u_xlat29, 0.0), 1.0);
#else
    u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat29 * u_xlat29;
    u_xlat9 = u_xlat9 * u_xlat28 + 1.00001001;
    u_xlat16_7.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat9 * u_xlat9;
    u_xlat9 = max(u_xlat16_7.x, 0.100000001);
    u_xlat0.x = u_xlat9 * u_xlat0.x;
    u_xlat0.x = u_xlat27 * u_xlat0.x;
    u_xlat0.x = u_xlat16_34 / u_xlat0.x;
    u_xlat16_7.x = u_xlat0.x + -6.10351562e-05;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_7.x = min(u_xlat16_7.x, 100.0);
    u_xlat16_7.xyz = u_xlat10_2.xyz * u_xlat16_7.xxx + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_8.xyz * u_xlat16_7.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_GBUFFER_NORMALS_OCT" "_LIT" "_SPOT" }
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
uniform 	vec4 _SpotLightScale;
uniform 	vec4 _SpotLightBias;
uniform 	vec4 _SpotLightGuard;
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
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xyz = _SpotLightScale.xyz * in_POSITION0.xyz + _SpotLightBias.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = _SpotLightGuard.w;
    u_xlat0.xyz = u_xlat0.xyz * _SpotLightScale.www + (-u_xlat1.yyz);
    u_xlat0.xyz = u_xlat0.xyz * _SpotLightGuard.xyz + u_xlat1.xyz;
    u_xlat6 = dot(in_POSITION0.xyz, in_POSITION0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6!=0.0);
#else
    u_xlatb6 = u_xlat6!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb6)) ? u_xlat0.xyz : in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.z = u_xlat0.w;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	vec3 _LightPosWS;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec4 _LightAttenuation;
uniform 	mediump vec3 _LightDirection;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat10_0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
uvec3 u_xlatu1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
ivec2 u_xlati3;
bvec2 u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat7;
float u_xlat8;
mediump float u_xlat16_9;
vec2 u_xlat14;
mediump float u_xlat10_14;
uvec2 u_xlatu14;
bool u_xlatb14;
mediump float u_xlat16_16;
float u_xlat21;
float u_xlat22;
mediump float u_xlat16_23;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(255.5, 255.5, 255.5);
    u_xlat16_2.x = (-u_xlat10_1.w) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlatu1.xyz = uvec3(u_xlat1.xyz);
    u_xlatu14.x = uint(u_xlatu1.z >> 4u);
    u_xlati3.y = int(int(u_xlatu14.x) << 8);
    u_xlati3.x = int(int_bitfieldInsert(0,int(u_xlatu1.z),8,4) );
    u_xlatu14.xy = uvec2(u_xlatu1.x | uint(u_xlati3.x), u_xlatu1.y | uint(u_xlati3.y));
    u_xlat14.xy = vec2(u_xlatu14.xy);
    u_xlat14.xy = u_xlat14.xy * vec2(0.000488400517, 0.000488400517) + vec2(-1.0, -1.0);
    u_xlat1.x = -abs(u_xlat14.x) + 1.0;
    u_xlat1.z = -abs(u_xlat14.y) + u_xlat1.x;
    u_xlat22 = max((-u_xlat1.z), 0.0);
    u_xlatb3.xy = greaterThanEqual(u_xlat14.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat3.x = (u_xlatb3.x) ? (-float(u_xlat22)) : float(u_xlat22);
    u_xlat3.y = (u_xlatb3.y) ? (-float(u_xlat22)) : float(u_xlat22);
    u_xlat1.xy = u_xlat14.xy + u_xlat3.xy;
    u_xlat14.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat1.xyz;
    u_xlat3 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat3 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat3;
    u_xlat10_14 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat3 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_14) + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat14.x = float(1.0) / float(u_xlat3.w);
    u_xlat4.xyz = (-u_xlat3.xyz) * u_xlat14.xxx + _WorldSpaceCameraPos.xyz;
    u_xlat3.xyz = (-u_xlat3.xyz) * u_xlat14.xxx + _LightPosWS.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb14 = unity_OrthoParams.w==0.0;
#endif
    u_xlat5.x = (u_xlatb14) ? u_xlat4.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = (u_xlatb14) ? u_xlat4.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = (u_xlatb14) ? u_xlat4.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat14.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat14.x = max(u_xlat14.x, 1.17549435e-38);
    u_xlat16_9 = inversesqrt(u_xlat14.x);
    u_xlat14.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat14.x = max(u_xlat14.x, 6.10351562e-05);
    u_xlat21 = inversesqrt(u_xlat14.x);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat16_9) + u_xlat3.xyz;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat16_9 = inversesqrt(u_xlat21);
    u_xlat4.xyz = vec3(u_xlat16_9) * u_xlat4.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_9 = dot(u_xlat1.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9 = min(max(u_xlat16_9, 0.0), 1.0);
#else
    u_xlat16_9 = clamp(u_xlat16_9, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_16 = dot(_LightDirection.xyz, u_xlat3.xyz);
    u_xlat16_16 = u_xlat16_16 * _LightAttenuation.z + _LightAttenuation.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16 = min(max(u_xlat16_16, 0.0), 1.0);
#else
    u_xlat16_16 = clamp(u_xlat16_16, 0.0, 1.0);
#endif
    u_xlat16_16 = u_xlat16_16 * u_xlat16_16;
    u_xlat16_23 = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat16_23, 0.100000001);
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat8 = u_xlat16_2.x * u_xlat16_2.x + -1.0;
    u_xlat21 = u_xlat21 * u_xlat8 + 1.00001001;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat1.x * u_xlat21;
    u_xlat1.x = u_xlat16_2.x * 4.0 + 2.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat21 = u_xlat16_2.x / u_xlat21;
    u_xlat16_2.x = u_xlat21 + -6.10351562e-05;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.x = min(u_xlat16_2.x, 100.0);
    u_xlat10_1.xyz = textureLod(_GBuffer0, u_xlat0.xy, 0.0).xyz;
    u_xlat10_0.xyw = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat16_6.xyz = u_xlat10_0.xyw * u_xlat16_2.xxx + u_xlat10_1.xyz;
    u_xlat0.x = float(1.0) / float(u_xlat14.x);
    u_xlat7 = u_xlat14.x * _LightAttenuation.x + _LightAttenuation.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.x = u_xlat16_16 * u_xlat0.x;
    u_xlat16_2.x = u_xlat16_9 * u_xlat0.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DEFERRED_SUBTRACTIVE_LIGHTING" "_LIT" "_SPOT" }
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
uniform 	vec4 _SpotLightScale;
uniform 	vec4 _SpotLightBias;
uniform 	vec4 _SpotLightGuard;
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
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xyz = _SpotLightScale.xyz * in_POSITION0.xyz + _SpotLightBias.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = _SpotLightGuard.w;
    u_xlat0.xyz = u_xlat0.xyz * _SpotLightScale.www + (-u_xlat1.yyz);
    u_xlat0.xyz = u_xlat0.xyz * _SpotLightGuard.xyz + u_xlat1.xyz;
    u_xlat6 = dot(in_POSITION0.xyz, in_POSITION0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6!=0.0);
#else
    u_xlatb6 = u_xlat6!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb6)) ? u_xlat0.xyz : in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.z = u_xlat0.w;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
vec4 ImmCB_0[4];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	vec3 _LightPosWS;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec4 _LightAttenuation;
uniform 	mediump vec3 _LightDirection;
uniform 	mediump vec4 _LightOcclusionProbInfo;
uniform 	int _LightFlags;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer4;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
mediump vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
float u_xlat8;
mediump float u_xlat16_15;
float u_xlat16;
mediump float u_xlat10_16;
int u_xlati16;
uint u_xlatu16;
bool u_xlatb16;
mediump float u_xlat16_23;
float u_xlat24;
float u_xlat25;
int u_xlati25;
bool u_xlatb25;
float u_xlat26;
mediump float u_xlat16_30;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat16 = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu16 = uint(u_xlat16);
    u_xlati16 = int(uint(u_xlatu16 & uint(_LightFlags)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlati16==4);
#else
    u_xlatb16 = u_xlati16==4;
#endif
    if(u_xlatb16){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat10_16 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat10_4 = textureLod(_GBuffer4, u_xlat0.xy, 0.0);
    u_xlat5 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat5 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat5;
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_16) + u_xlat5;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat24 = float(1.0) / float(u_xlat0.w);
    u_xlat16_6.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat10_3.xyz * u_xlat16_6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb25 = unity_OrthoParams.w==0.0;
#endif
    u_xlat3.xyz = (-u_xlat0.xyz) * vec3(u_xlat24) + _WorldSpaceCameraPos.xyz;
    u_xlat5.x = (u_xlatb25) ? u_xlat3.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = (u_xlatb25) ? u_xlat3.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = (u_xlatb25) ? u_xlat3.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat25 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat25 = max(u_xlat25, 1.17549435e-38);
    u_xlat16_30 = inversesqrt(u_xlat25);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat24) + _LightPosWS.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 6.10351562e-05);
    u_xlat25 = inversesqrt(u_xlat24);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat25);
    u_xlat25 = float(1.0) / float(u_xlat24);
    u_xlat24 = u_xlat24 * _LightAttenuation.x + _LightAttenuation.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat24 = u_xlat24 * u_xlat25;
    u_xlat16_7.x = dot(_LightDirection.xyz, u_xlat0.xyz);
    u_xlat16_7.x = u_xlat16_7.x * _LightAttenuation.z + _LightAttenuation.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat24 = u_xlat24 * u_xlat16_7.x;
    u_xlati25 = int(_LightOcclusionProbInfo.x);
    u_xlat16_7.x = dot(u_xlat10_4, ImmCB_0[u_xlati25]);
    u_xlat16_7.x = max(u_xlat16_7.x, _LightOcclusionProbInfo.y);
    u_xlat16_7.x = u_xlat24 * u_xlat16_7.x;
    u_xlat24 = u_xlat10_3.w * 0.5 + 0.5;
    u_xlat16_15 = (-u_xlat24) + 1.0;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat16_15 = max(u_xlat16_15, 0.0078125);
    u_xlat16_23 = u_xlat16_15 * u_xlat16_15;
    u_xlat24 = u_xlat16_15 * 4.0 + 2.0;
    u_xlat25 = u_xlat16_15 * u_xlat16_15 + -1.0;
    u_xlat16_15 = dot(u_xlat16_6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15 = min(max(u_xlat16_15, 0.0), 1.0);
#else
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_15 * u_xlat16_7.x;
    u_xlat16_7.xyw = u_xlat16_7.xxx * _LightColor.xyz;
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat16_30) + u_xlat0.xyz;
    u_xlat26 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat26 = max(u_xlat26, 1.17549435e-38);
    u_xlat16_30 = inversesqrt(u_xlat26);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_30);
    u_xlat26 = dot(u_xlat16_6.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8 = u_xlat26 * u_xlat26;
    u_xlat8 = u_xlat8 * u_xlat25 + 1.00001001;
    u_xlat16_6.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat8 * u_xlat8;
    u_xlat8 = max(u_xlat16_6.x, 0.100000001);
    u_xlat0.x = u_xlat8 * u_xlat0.x;
    u_xlat0.x = u_xlat24 * u_xlat0.x;
    u_xlat0.x = u_xlat16_23 / u_xlat0.x;
    u_xlat16_6.x = u_xlat0.x + -6.10351562e-05;
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = min(u_xlat16_6.x, 100.0);
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat16_6.xxx + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_7.xyw * u_xlat16_6.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_LIT" "_SPOT" }
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
uniform 	vec4 _SpotLightScale;
uniform 	vec4 _SpotLightBias;
uniform 	vec4 _SpotLightGuard;
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
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xyz = _SpotLightScale.xyz * in_POSITION0.xyz + _SpotLightBias.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = _SpotLightGuard.w;
    u_xlat0.xyz = u_xlat0.xyz * _SpotLightScale.www + (-u_xlat1.yyz);
    u_xlat0.xyz = u_xlat0.xyz * _SpotLightGuard.xyz + u_xlat1.xyz;
    u_xlat6 = dot(in_POSITION0.xyz, in_POSITION0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6!=0.0);
#else
    u_xlatb6 = u_xlat6!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb6)) ? u_xlat0.xyz : in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.z = u_xlat0.w;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	vec3 _LightPosWS;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec4 _LightAttenuation;
uniform 	mediump vec3 _LightDirection;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec2 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
mediump float u_xlat16_10;
float u_xlat13;
mediump float u_xlat10_13;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
mediump float u_xlat16_22;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat0;
    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_13 = textureLod(_CameraDepthTexture, u_xlat1.xy, 0.0).x;
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_13) + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat18 = float(1.0) / float(u_xlat0.w);
    u_xlat2.xyz = (-u_xlat0.xyz) * vec3(u_xlat18) + _WorldSpaceCameraPos.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat18) + _LightPosWS.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb18 = unity_OrthoParams.w==0.0;
#endif
    u_xlat3.x = (u_xlatb18) ? u_xlat2.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat3.y = (u_xlatb18) ? u_xlat2.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat3.z = (u_xlatb18) ? u_xlat2.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_4.x = inversesqrt(u_xlat18);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 6.10351562e-05);
    u_xlat13 = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat13);
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = max(u_xlat13, 1.17549435e-38);
    u_xlat16_4.x = inversesqrt(u_xlat13);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_4.xxx;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat1.xy, 0.0);
    u_xlat16_4.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xxx;
    u_xlat13 = u_xlat10_3.w * 0.5 + 0.5;
    u_xlat16_22 = (-u_xlat13) + 1.0;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_22 = max(u_xlat16_22, 0.0078125);
    u_xlat13 = dot(u_xlat16_4.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13 = min(max(u_xlat13, 0.0), 1.0);
#else
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
#endif
    u_xlat19 = dot(u_xlat0.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat19 * u_xlat19;
    u_xlat19 = max(u_xlat16_5.x, 0.100000001);
    u_xlat16_4.x = dot(u_xlat16_4.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_10 = dot(_LightDirection.xyz, u_xlat0.xyz);
    u_xlat16_10 = u_xlat16_10 * _LightAttenuation.z + _LightAttenuation.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10 = min(max(u_xlat16_10, 0.0), 1.0);
#else
    u_xlat16_10 = clamp(u_xlat16_10, 0.0, 1.0);
#endif
    u_xlat16_10 = u_xlat16_10 * u_xlat16_10;
    u_xlat0.x = u_xlat13 * u_xlat13;
    u_xlat6 = u_xlat16_22 * u_xlat16_22 + -1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6 + 1.00001001;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat19 * u_xlat0.x;
    u_xlat6 = u_xlat16_22 * 4.0 + 2.0;
    u_xlat16_16 = u_xlat16_22 * u_xlat16_22;
    u_xlat0.x = u_xlat6 * u_xlat0.x;
    u_xlat0.x = u_xlat16_16 / u_xlat0.x;
    u_xlat16_16 = u_xlat0.x + -6.10351562e-05;
    u_xlat16_16 = max(u_xlat16_16, 0.0);
    u_xlat16_16 = min(u_xlat16_16, 100.0);
    u_xlat10_0.xyz = textureLod(_GBuffer0, u_xlat1.xy, 0.0).xyz;
    u_xlat10_1.xyz = textureLod(_GBuffer1, u_xlat1.xy, 0.0).xyz;
    u_xlat16_5.xyz = u_xlat10_1.xyz * vec3(u_xlat16_16) + u_xlat10_0.xyz;
    u_xlat0.x = float(1.0) / float(u_xlat18);
    u_xlat6 = u_xlat18 * _LightAttenuation.x + _LightAttenuation.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat6 * u_xlat0.x;
    u_xlat0.x = u_xlat16_10 * u_xlat0.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat0.x;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _LightColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
}
 Pass {
  Name "Deferred Punctual Light (SimpleLit)"
  Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  Blend One One, Zero One
  ZClip Off
  ZTest GEqual
  ZWrite Off
  Cull Front
  Stencil {
   ReadMask 0
   WriteMask 0
   CompBack Equal
   PassBack Zero
   FailBack Keep
   ZFailBack Keep
  }
  GpuProgramID 184647
Program "vp" {
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_POINT" "_SIMPLELIT" }
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
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.z = u_xlat0.w;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	vec3 _LightPosWS;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec4 _LightAttenuation;
uniform 	mediump vec3 _LightDirection;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec2 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
mediump vec3 u_xlat16_10;
float u_xlat13;
mediump float u_xlat10_13;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat0;
    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_13 = textureLod(_CameraDepthTexture, u_xlat1.xy, 0.0).x;
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_13) + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat18 = float(1.0) / float(u_xlat0.w);
    u_xlat2.xyz = (-u_xlat0.xyz) * vec3(u_xlat18) + _WorldSpaceCameraPos.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat18) + _LightPosWS.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb18 = unity_OrthoParams.w==0.0;
#endif
    u_xlat3.x = (u_xlatb18) ? u_xlat2.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat3.y = (u_xlatb18) ? u_xlat2.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat3.z = (u_xlatb18) ? u_xlat2.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_4.x = inversesqrt(u_xlat18);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 6.10351562e-05);
    u_xlat13 = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat13);
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = max(u_xlat13, 1.17549435e-38);
    u_xlat16_4.x = inversesqrt(u_xlat13);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_4.xxx;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat1.xy, 0.0);
    u_xlat16_4.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xxx;
    u_xlat13 = u_xlat10_3.w * 5.0 + 6.0;
    u_xlat13 = exp2(u_xlat13);
    u_xlat19 = dot(u_xlat16_4.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_4.x = dot(u_xlat16_4.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = dot(_LightDirection.xyz, u_xlat0.xyz);
    u_xlat16_10.x = u_xlat16_10.x * _LightAttenuation.z + _LightAttenuation.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_16 = log2(u_xlat19);
    u_xlat16_16 = u_xlat13 * u_xlat16_16;
    u_xlat16_16 = exp2(u_xlat16_16);
    u_xlat10_0.xyz = textureLod(_GBuffer1, u_xlat1.xy, 0.0).xyz;
    u_xlat10_1.xyz = textureLod(_GBuffer0, u_xlat1.xy, 0.0).xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_16) * u_xlat10_0.xyz;
    u_xlat0.x = float(1.0) / float(u_xlat18);
    u_xlat6 = u_xlat18 * _LightAttenuation.x + _LightAttenuation.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat6 * u_xlat0.x;
    u_xlat0.x = u_xlat16_10.x * u_xlat0.x;
    u_xlat16_10.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_10.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat10_1.xyz + u_xlat16_5.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DEFERRED_SUBTRACTIVE_LIGHTING" "_POINT" "_SIMPLELIT" }
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
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.z = u_xlat0.w;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
vec4 ImmCB_0[4];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	vec3 _LightPosWS;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec4 _LightAttenuation;
uniform 	mediump vec3 _LightDirection;
uniform 	mediump vec4 _LightOcclusionProbInfo;
uniform 	int _LightFlags;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer4;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
mediump vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat18;
mediump float u_xlat10_18;
int u_xlati18;
uint u_xlatu18;
bool u_xlatb18;
float u_xlat27;
float u_xlat28;
int u_xlati28;
bool u_xlatb28;
mediump float u_xlat16_33;
mediump float u_xlat16_34;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat18 = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu18 = uint(u_xlat18);
    u_xlati18 = int(uint(u_xlatu18 & uint(_LightFlags)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlati18==4);
#else
    u_xlatb18 = u_xlati18==4;
#endif
    if(u_xlatb18){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat10_18 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat10_4 = textureLod(_GBuffer4, u_xlat0.xy, 0.0);
    u_xlat5 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat5 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat5;
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_18) + u_xlat5;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat27 = float(1.0) / float(u_xlat0.w);
    u_xlat16_6.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat10_3.xyz * u_xlat16_6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb28 = unity_OrthoParams.w==0.0;
#endif
    u_xlat3.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + _WorldSpaceCameraPos.xyz;
    u_xlat5.x = (u_xlatb28) ? u_xlat3.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = (u_xlatb28) ? u_xlat3.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = (u_xlatb28) ? u_xlat3.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat28 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat28 = max(u_xlat28, 1.17549435e-38);
    u_xlat16_33 = inversesqrt(u_xlat28);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + _LightPosWS.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 6.10351562e-05);
    u_xlat28 = inversesqrt(u_xlat27);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat28);
    u_xlat28 = float(1.0) / float(u_xlat27);
    u_xlat27 = u_xlat27 * _LightAttenuation.x + _LightAttenuation.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat27 * u_xlat28;
    u_xlat16_7.x = dot(_LightDirection.xyz, u_xlat0.xyz);
    u_xlat16_7.x = u_xlat16_7.x * _LightAttenuation.z + _LightAttenuation.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat27 = u_xlat27 * u_xlat16_7.x;
    u_xlati28 = int(_LightOcclusionProbInfo.x);
    u_xlat16_7.x = dot(u_xlat10_4, ImmCB_0[u_xlati28]);
    u_xlat16_7.x = max(u_xlat16_7.x, _LightOcclusionProbInfo.y);
    u_xlat16_7.x = u_xlat27 * u_xlat16_7.x;
    u_xlat27 = u_xlat10_3.w * 5.0 + 6.0;
    u_xlat27 = exp2(u_xlat27);
    u_xlat16_7.xyz = u_xlat16_7.xxx * _LightColor.xyz;
    u_xlat16_34 = dot(u_xlat16_6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34 = min(max(u_xlat16_34, 0.0), 1.0);
#else
    u_xlat16_34 = clamp(u_xlat16_34, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat5.xyz * vec3(u_xlat16_33) + u_xlat0.xyz;
    u_xlat28 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat28 = max(u_xlat28, 1.17549435e-38);
    u_xlat16_33 = inversesqrt(u_xlat28);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_33);
    u_xlat0.x = dot(u_xlat16_6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = log2(u_xlat0.x);
    u_xlat16_6.x = u_xlat27 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat16_6.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat16_8.xyz * u_xlat10_1.xyz + u_xlat16_6.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_GBUFFER_NORMALS_OCT" "_POINT" "_SIMPLELIT" }
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
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.z = u_xlat0.w;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	vec3 _LightPosWS;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec4 _LightAttenuation;
uniform 	mediump vec3 _LightDirection;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat10_0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
uvec3 u_xlatu1;
vec4 u_xlat2;
ivec2 u_xlati2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_12;
float u_xlat14;
vec2 u_xlat15;
bvec2 u_xlatb15;
mediump float u_xlat16_19;
float u_xlat21;
mediump float u_xlat10_21;
uint u_xlatu21;
bool u_xlatb21;
float u_xlat22;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(255.5, 255.5, 255.5);
    u_xlat14 = u_xlat10_1.w * 10.0 + 1.0;
    u_xlat14 = exp2(u_xlat14);
    u_xlatu1.xyz = uvec3(u_xlat1.xyz);
    u_xlatu21 = uint(u_xlatu1.z >> 4u);
    u_xlati2.y = int(int(u_xlatu21) << 8);
    u_xlati2.x = int(int_bitfieldInsert(0,int(u_xlatu1.z),8,4) );
    u_xlatu1.xy = uvec2(u_xlatu1.x | uint(u_xlati2.x), u_xlatu1.y | uint(u_xlati2.y));
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(0.000488400517, 0.000488400517) + vec2(-1.0, -1.0);
    u_xlat21 = -abs(u_xlat1.x) + 1.0;
    u_xlat2.z = -abs(u_xlat1.y) + u_xlat21;
    u_xlat21 = max((-u_xlat2.z), 0.0);
    u_xlatb15.xy = greaterThanEqual(u_xlat1.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat15.x = (u_xlatb15.x) ? (-float(u_xlat21)) : float(u_xlat21);
    u_xlat15.y = (u_xlatb15.y) ? (-float(u_xlat21)) : float(u_xlat21);
    u_xlat2.xy = u_xlat15.xy + u_xlat1.xy;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat2 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat2 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat2;
    u_xlat10_21 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat2 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_21) + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat21 = float(1.0) / float(u_xlat2.w);
    u_xlat3.xyz = (-u_xlat2.xyz) * vec3(u_xlat21) + _WorldSpaceCameraPos.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat21) + _LightPosWS.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb21 = unity_OrthoParams.w==0.0;
#endif
    u_xlat4.x = (u_xlatb21) ? u_xlat3.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = (u_xlatb21) ? u_xlat3.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = (u_xlatb21) ? u_xlat3.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat16_5.x = inversesqrt(u_xlat21);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 6.10351562e-05);
    u_xlat22 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat4.xyz * u_xlat16_5.xxx + u_xlat2.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = max(u_xlat22, 1.17549435e-38);
    u_xlat16_5.x = inversesqrt(u_xlat22);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_5.xxx;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat1.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(_LightDirection.xyz, u_xlat2.xyz);
    u_xlat16_12.x = u_xlat16_12.x * _LightAttenuation.z + _LightAttenuation.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_19 = log2(u_xlat22);
    u_xlat16_19 = u_xlat14 * u_xlat16_19;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat10_1.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_0.xyz = textureLod(_GBuffer0, u_xlat0.xy, 0.0).xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_19) * u_xlat10_1.xyz;
    u_xlat1.x = float(1.0) / float(u_xlat21);
    u_xlat21 = u_xlat21 * _LightAttenuation.x + _LightAttenuation.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat21 = u_xlat16_12.x * u_xlat21;
    u_xlat16_12.xyz = vec3(u_xlat21) * _LightColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_12.xyz;
    SV_Target0.xyz = u_xlat16_5.xyz * u_xlat10_0.xyz + u_xlat16_6.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DEFERRED_SUBTRACTIVE_LIGHTING" "_GBUFFER_NORMALS_OCT" "_POINT" "_SIMPLELIT" }
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
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.z = u_xlat0.w;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
vec4 ImmCB_0[4];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	vec3 _LightPosWS;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec4 _LightAttenuation;
uniform 	mediump vec3 _LightDirection;
uniform 	mediump vec4 _LightOcclusionProbInfo;
uniform 	int _LightFlags;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer4;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
uvec3 u_xlatu3;
mediump vec4 u_xlat10_4;
vec4 u_xlat5;
ivec2 u_xlati5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_17;
float u_xlat20;
mediump float u_xlat10_20;
int u_xlati20;
uint u_xlatu20;
bool u_xlatb20;
float u_xlat30;
float u_xlat31;
int u_xlati31;
uint u_xlatu31;
bool u_xlatb31;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat20 = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu20 = uint(u_xlat20);
    u_xlati20 = int(uint(u_xlatu20 & uint(_LightFlags)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlati20==4);
#else
    u_xlatb20 = u_xlati20==4;
#endif
    if(u_xlatb20){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat10_20 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat10_4 = textureLod(_GBuffer4, u_xlat0.xy, 0.0);
    u_xlat5 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat5 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat5;
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_20) + u_xlat5;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat30 = float(1.0) / float(u_xlat0.w);
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(255.5, 255.5, 255.5);
    u_xlatu3.xyz = uvec3(u_xlat3.xyz);
    u_xlatu31 = uint(u_xlatu3.z >> 4u);
    u_xlati5.x = int(int_bitfieldInsert(0,int(u_xlatu3.z),8,4) );
    u_xlati5.y = int(int(u_xlatu31) << 8);
    u_xlatu3.xy = uvec2(u_xlatu3.x | uint(u_xlati5.x), u_xlatu3.y | uint(u_xlati5.y));
    u_xlat3.xy = vec2(u_xlatu3.xy);
    u_xlat3.xy = u_xlat3.xy * vec2(0.000488400517, 0.000488400517) + vec2(-1.0, -1.0);
    u_xlat31 = -abs(u_xlat3.x) + 1.0;
    u_xlat5.z = -abs(u_xlat3.y) + u_xlat31;
    u_xlat31 = max((-u_xlat5.z), 0.0);
    u_xlatb6.xy = greaterThanEqual(u_xlat3.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat6.x = (u_xlatb6.x) ? (-float(u_xlat31)) : float(u_xlat31);
    u_xlat6.y = (u_xlatb6.y) ? (-float(u_xlat31)) : float(u_xlat31);
    u_xlat5.xy = u_xlat3.xy + u_xlat6.xy;
    u_xlat31 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat3.xyz = vec3(u_xlat31) * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb31 = unity_OrthoParams.w==0.0;
#endif
    u_xlat5.xyz = (-u_xlat0.xyz) * vec3(u_xlat30) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = (u_xlatb31) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = (u_xlatb31) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = (u_xlatb31) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat31 = max(u_xlat31, 1.17549435e-38);
    u_xlat16_7.x = inversesqrt(u_xlat31);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat30) + _LightPosWS.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = max(u_xlat30, 6.10351562e-05);
    u_xlat31 = inversesqrt(u_xlat30);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat31);
    u_xlat31 = float(1.0) / float(u_xlat30);
    u_xlat30 = u_xlat30 * _LightAttenuation.x + _LightAttenuation.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat30 = u_xlat30 * u_xlat31;
    u_xlat16_17.x = dot(_LightDirection.xyz, u_xlat0.xyz);
    u_xlat16_17.x = u_xlat16_17.x * _LightAttenuation.z + _LightAttenuation.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat30 = u_xlat30 * u_xlat16_17.x;
    u_xlati31 = int(_LightOcclusionProbInfo.x);
    u_xlat16_17.x = dot(u_xlat10_4, ImmCB_0[u_xlati31]);
    u_xlat16_17.x = max(u_xlat16_17.x, _LightOcclusionProbInfo.y);
    u_xlat16_17.x = u_xlat30 * u_xlat16_17.x;
    u_xlat30 = u_xlat10_3.w * 10.0 + 1.0;
    u_xlat30 = exp2(u_xlat30);
    u_xlat16_17.xyz = u_xlat16_17.xxx * _LightColor.xyz;
    u_xlat16_8.x = dot(u_xlat3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_17.xyz * u_xlat16_8.xxx;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat16_7.xxx + u_xlat0.xyz;
    u_xlat31 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat31 = max(u_xlat31, 1.17549435e-38);
    u_xlat16_7.x = inversesqrt(u_xlat31);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_7.xxx;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = log2(u_xlat0.x);
    u_xlat16_7.x = u_xlat30 * u_xlat16_7.x;
    u_xlat16_7.x = exp2(u_xlat16_7.x);
    u_xlat16_9.xyz = u_xlat10_2.xyz * u_xlat16_7.xxx;
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16_9.xyz;
    SV_Target0.xyz = u_xlat16_8.xyz * u_xlat10_1.xyz + u_xlat16_7.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DEFERRED_SUBTRACTIVE_LIGHTING" "_GBUFFER_NORMALS_OCT" "_SIMPLELIT" "_SPOT" }
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
uniform 	vec4 _SpotLightScale;
uniform 	vec4 _SpotLightBias;
uniform 	vec4 _SpotLightGuard;
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
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xyz = _SpotLightScale.xyz * in_POSITION0.xyz + _SpotLightBias.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = _SpotLightGuard.w;
    u_xlat0.xyz = u_xlat0.xyz * _SpotLightScale.www + (-u_xlat1.yyz);
    u_xlat0.xyz = u_xlat0.xyz * _SpotLightGuard.xyz + u_xlat1.xyz;
    u_xlat6 = dot(in_POSITION0.xyz, in_POSITION0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6!=0.0);
#else
    u_xlatb6 = u_xlat6!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb6)) ? u_xlat0.xyz : in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.z = u_xlat0.w;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
vec4 ImmCB_0[4];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	vec3 _LightPosWS;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec4 _LightAttenuation;
uniform 	mediump vec3 _LightDirection;
uniform 	mediump vec4 _LightOcclusionProbInfo;
uniform 	int _LightFlags;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer4;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
uvec3 u_xlatu3;
mediump vec4 u_xlat10_4;
vec4 u_xlat5;
ivec2 u_xlati5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_17;
float u_xlat20;
mediump float u_xlat10_20;
int u_xlati20;
uint u_xlatu20;
bool u_xlatb20;
float u_xlat30;
float u_xlat31;
int u_xlati31;
uint u_xlatu31;
bool u_xlatb31;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat20 = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu20 = uint(u_xlat20);
    u_xlati20 = int(uint(u_xlatu20 & uint(_LightFlags)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlati20==4);
#else
    u_xlatb20 = u_xlati20==4;
#endif
    if(u_xlatb20){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat10_20 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat10_4 = textureLod(_GBuffer4, u_xlat0.xy, 0.0);
    u_xlat5 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat5 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat5;
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_20) + u_xlat5;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat30 = float(1.0) / float(u_xlat0.w);
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(255.5, 255.5, 255.5);
    u_xlatu3.xyz = uvec3(u_xlat3.xyz);
    u_xlatu31 = uint(u_xlatu3.z >> 4u);
    u_xlati5.x = int(int_bitfieldInsert(0,int(u_xlatu3.z),8,4) );
    u_xlati5.y = int(int(u_xlatu31) << 8);
    u_xlatu3.xy = uvec2(u_xlatu3.x | uint(u_xlati5.x), u_xlatu3.y | uint(u_xlati5.y));
    u_xlat3.xy = vec2(u_xlatu3.xy);
    u_xlat3.xy = u_xlat3.xy * vec2(0.000488400517, 0.000488400517) + vec2(-1.0, -1.0);
    u_xlat31 = -abs(u_xlat3.x) + 1.0;
    u_xlat5.z = -abs(u_xlat3.y) + u_xlat31;
    u_xlat31 = max((-u_xlat5.z), 0.0);
    u_xlatb6.xy = greaterThanEqual(u_xlat3.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat6.x = (u_xlatb6.x) ? (-float(u_xlat31)) : float(u_xlat31);
    u_xlat6.y = (u_xlatb6.y) ? (-float(u_xlat31)) : float(u_xlat31);
    u_xlat5.xy = u_xlat3.xy + u_xlat6.xy;
    u_xlat31 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat3.xyz = vec3(u_xlat31) * u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb31 = unity_OrthoParams.w==0.0;
#endif
    u_xlat5.xyz = (-u_xlat0.xyz) * vec3(u_xlat30) + _WorldSpaceCameraPos.xyz;
    u_xlat6.x = (u_xlatb31) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = (u_xlatb31) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = (u_xlatb31) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat31 = max(u_xlat31, 1.17549435e-38);
    u_xlat16_7.x = inversesqrt(u_xlat31);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat30) + _LightPosWS.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = max(u_xlat30, 6.10351562e-05);
    u_xlat31 = inversesqrt(u_xlat30);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat31);
    u_xlat31 = float(1.0) / float(u_xlat30);
    u_xlat30 = u_xlat30 * _LightAttenuation.x + _LightAttenuation.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat30 = u_xlat30 * u_xlat31;
    u_xlat16_17.x = dot(_LightDirection.xyz, u_xlat0.xyz);
    u_xlat16_17.x = u_xlat16_17.x * _LightAttenuation.z + _LightAttenuation.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat30 = u_xlat30 * u_xlat16_17.x;
    u_xlati31 = int(_LightOcclusionProbInfo.x);
    u_xlat16_17.x = dot(u_xlat10_4, ImmCB_0[u_xlati31]);
    u_xlat16_17.x = max(u_xlat16_17.x, _LightOcclusionProbInfo.y);
    u_xlat16_17.x = u_xlat30 * u_xlat16_17.x;
    u_xlat30 = u_xlat10_3.w * 10.0 + 1.0;
    u_xlat30 = exp2(u_xlat30);
    u_xlat16_17.xyz = u_xlat16_17.xxx * _LightColor.xyz;
    u_xlat16_8.x = dot(u_xlat3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_17.xyz * u_xlat16_8.xxx;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat16_7.xxx + u_xlat0.xyz;
    u_xlat31 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat31 = max(u_xlat31, 1.17549435e-38);
    u_xlat16_7.x = inversesqrt(u_xlat31);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_7.xxx;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = log2(u_xlat0.x);
    u_xlat16_7.x = u_xlat30 * u_xlat16_7.x;
    u_xlat16_7.x = exp2(u_xlat16_7.x);
    u_xlat16_9.xyz = u_xlat10_2.xyz * u_xlat16_7.xxx;
    u_xlat16_7.xyz = u_xlat16_17.xyz * u_xlat16_9.xyz;
    SV_Target0.xyz = u_xlat16_8.xyz * u_xlat10_1.xyz + u_xlat16_7.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_GBUFFER_NORMALS_OCT" "_SIMPLELIT" "_SPOT" }
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
uniform 	vec4 _SpotLightScale;
uniform 	vec4 _SpotLightBias;
uniform 	vec4 _SpotLightGuard;
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
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xyz = _SpotLightScale.xyz * in_POSITION0.xyz + _SpotLightBias.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = _SpotLightGuard.w;
    u_xlat0.xyz = u_xlat0.xyz * _SpotLightScale.www + (-u_xlat1.yyz);
    u_xlat0.xyz = u_xlat0.xyz * _SpotLightGuard.xyz + u_xlat1.xyz;
    u_xlat6 = dot(in_POSITION0.xyz, in_POSITION0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6!=0.0);
#else
    u_xlatb6 = u_xlat6!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb6)) ? u_xlat0.xyz : in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.z = u_xlat0.w;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	vec3 _LightPosWS;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec4 _LightAttenuation;
uniform 	mediump vec3 _LightDirection;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat10_0;
vec3 u_xlat1;
mediump vec4 u_xlat10_1;
uvec3 u_xlatu1;
vec4 u_xlat2;
ivec2 u_xlati2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_12;
float u_xlat14;
vec2 u_xlat15;
bvec2 u_xlatb15;
mediump float u_xlat16_19;
float u_xlat21;
mediump float u_xlat10_21;
uint u_xlatu21;
bool u_xlatb21;
float u_xlat22;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(255.5, 255.5, 255.5);
    u_xlat14 = u_xlat10_1.w * 10.0 + 1.0;
    u_xlat14 = exp2(u_xlat14);
    u_xlatu1.xyz = uvec3(u_xlat1.xyz);
    u_xlatu21 = uint(u_xlatu1.z >> 4u);
    u_xlati2.y = int(int(u_xlatu21) << 8);
    u_xlati2.x = int(int_bitfieldInsert(0,int(u_xlatu1.z),8,4) );
    u_xlatu1.xy = uvec2(u_xlatu1.x | uint(u_xlati2.x), u_xlatu1.y | uint(u_xlati2.y));
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(0.000488400517, 0.000488400517) + vec2(-1.0, -1.0);
    u_xlat21 = -abs(u_xlat1.x) + 1.0;
    u_xlat2.z = -abs(u_xlat1.y) + u_xlat21;
    u_xlat21 = max((-u_xlat2.z), 0.0);
    u_xlatb15.xy = greaterThanEqual(u_xlat1.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat15.x = (u_xlatb15.x) ? (-float(u_xlat21)) : float(u_xlat21);
    u_xlat15.y = (u_xlatb15.y) ? (-float(u_xlat21)) : float(u_xlat21);
    u_xlat2.xy = u_xlat15.xy + u_xlat1.xy;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat2 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat2 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat2;
    u_xlat10_21 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat2 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_21) + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat21 = float(1.0) / float(u_xlat2.w);
    u_xlat3.xyz = (-u_xlat2.xyz) * vec3(u_xlat21) + _WorldSpaceCameraPos.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat21) + _LightPosWS.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb21 = unity_OrthoParams.w==0.0;
#endif
    u_xlat4.x = (u_xlatb21) ? u_xlat3.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = (u_xlatb21) ? u_xlat3.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = (u_xlatb21) ? u_xlat3.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat16_5.x = inversesqrt(u_xlat21);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 6.10351562e-05);
    u_xlat22 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat4.xyz * u_xlat16_5.xxx + u_xlat2.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = max(u_xlat22, 1.17549435e-38);
    u_xlat16_5.x = inversesqrt(u_xlat22);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_5.xxx;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat1.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = dot(_LightDirection.xyz, u_xlat2.xyz);
    u_xlat16_12.x = u_xlat16_12.x * _LightAttenuation.z + _LightAttenuation.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_19 = log2(u_xlat22);
    u_xlat16_19 = u_xlat14 * u_xlat16_19;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat10_1.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_0.xyz = textureLod(_GBuffer0, u_xlat0.xy, 0.0).xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_19) * u_xlat10_1.xyz;
    u_xlat1.x = float(1.0) / float(u_xlat21);
    u_xlat21 = u_xlat21 * _LightAttenuation.x + _LightAttenuation.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat21 = u_xlat16_12.x * u_xlat21;
    u_xlat16_12.xyz = vec3(u_xlat21) * _LightColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_12.xyz;
    SV_Target0.xyz = u_xlat16_5.xyz * u_xlat10_0.xyz + u_xlat16_6.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DEFERRED_SUBTRACTIVE_LIGHTING" "_SIMPLELIT" "_SPOT" }
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
uniform 	vec4 _SpotLightScale;
uniform 	vec4 _SpotLightBias;
uniform 	vec4 _SpotLightGuard;
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
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xyz = _SpotLightScale.xyz * in_POSITION0.xyz + _SpotLightBias.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = _SpotLightGuard.w;
    u_xlat0.xyz = u_xlat0.xyz * _SpotLightScale.www + (-u_xlat1.yyz);
    u_xlat0.xyz = u_xlat0.xyz * _SpotLightGuard.xyz + u_xlat1.xyz;
    u_xlat6 = dot(in_POSITION0.xyz, in_POSITION0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6!=0.0);
#else
    u_xlatb6 = u_xlat6!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb6)) ? u_xlat0.xyz : in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.z = u_xlat0.w;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
vec4 ImmCB_0[4];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	vec3 _LightPosWS;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec4 _LightAttenuation;
uniform 	mediump vec3 _LightDirection;
uniform 	mediump vec4 _LightOcclusionProbInfo;
uniform 	int _LightFlags;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer4;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
mediump vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat18;
mediump float u_xlat10_18;
int u_xlati18;
uint u_xlatu18;
bool u_xlatb18;
float u_xlat27;
float u_xlat28;
int u_xlati28;
bool u_xlatb28;
mediump float u_xlat16_33;
mediump float u_xlat16_34;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat18 = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu18 = uint(u_xlat18);
    u_xlati18 = int(uint(u_xlatu18 & uint(_LightFlags)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlati18==4);
#else
    u_xlatb18 = u_xlati18==4;
#endif
    if(u_xlatb18){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat10_18 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat10_4 = textureLod(_GBuffer4, u_xlat0.xy, 0.0);
    u_xlat5 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat5 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat5;
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_18) + u_xlat5;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat27 = float(1.0) / float(u_xlat0.w);
    u_xlat16_6.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat10_3.xyz * u_xlat16_6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb28 = unity_OrthoParams.w==0.0;
#endif
    u_xlat3.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + _WorldSpaceCameraPos.xyz;
    u_xlat5.x = (u_xlatb28) ? u_xlat3.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = (u_xlatb28) ? u_xlat3.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = (u_xlatb28) ? u_xlat3.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat28 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat28 = max(u_xlat28, 1.17549435e-38);
    u_xlat16_33 = inversesqrt(u_xlat28);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + _LightPosWS.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 6.10351562e-05);
    u_xlat28 = inversesqrt(u_xlat27);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat28);
    u_xlat28 = float(1.0) / float(u_xlat27);
    u_xlat27 = u_xlat27 * _LightAttenuation.x + _LightAttenuation.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat27 * u_xlat28;
    u_xlat16_7.x = dot(_LightDirection.xyz, u_xlat0.xyz);
    u_xlat16_7.x = u_xlat16_7.x * _LightAttenuation.z + _LightAttenuation.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat27 = u_xlat27 * u_xlat16_7.x;
    u_xlati28 = int(_LightOcclusionProbInfo.x);
    u_xlat16_7.x = dot(u_xlat10_4, ImmCB_0[u_xlati28]);
    u_xlat16_7.x = max(u_xlat16_7.x, _LightOcclusionProbInfo.y);
    u_xlat16_7.x = u_xlat27 * u_xlat16_7.x;
    u_xlat27 = u_xlat10_3.w * 5.0 + 6.0;
    u_xlat27 = exp2(u_xlat27);
    u_xlat16_7.xyz = u_xlat16_7.xxx * _LightColor.xyz;
    u_xlat16_34 = dot(u_xlat16_6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34 = min(max(u_xlat16_34, 0.0), 1.0);
#else
    u_xlat16_34 = clamp(u_xlat16_34, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat5.xyz * vec3(u_xlat16_33) + u_xlat0.xyz;
    u_xlat28 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat28 = max(u_xlat28, 1.17549435e-38);
    u_xlat16_33 = inversesqrt(u_xlat28);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_33);
    u_xlat0.x = dot(u_xlat16_6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = log2(u_xlat0.x);
    u_xlat16_6.x = u_xlat27 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat16_6.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat16_8.xyz * u_xlat10_1.xyz + u_xlat16_6.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_SIMPLELIT" "_SPOT" }
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
uniform 	vec4 _SpotLightScale;
uniform 	vec4 _SpotLightBias;
uniform 	vec4 _SpotLightGuard;
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
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xyz = _SpotLightScale.xyz * in_POSITION0.xyz + _SpotLightBias.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = _SpotLightGuard.w;
    u_xlat0.xyz = u_xlat0.xyz * _SpotLightScale.www + (-u_xlat1.yyz);
    u_xlat0.xyz = u_xlat0.xyz * _SpotLightGuard.xyz + u_xlat1.xyz;
    u_xlat6 = dot(in_POSITION0.xyz, in_POSITION0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6!=0.0);
#else
    u_xlatb6 = u_xlat6!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb6)) ? u_xlat0.xyz : in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat0.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.z = u_xlat0.w;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	vec3 _LightPosWS;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec4 _LightAttenuation;
uniform 	mediump vec3 _LightDirection;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec2 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
mediump vec3 u_xlat16_10;
float u_xlat13;
mediump float u_xlat10_13;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat0;
    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_13 = textureLod(_CameraDepthTexture, u_xlat1.xy, 0.0).x;
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_13) + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat18 = float(1.0) / float(u_xlat0.w);
    u_xlat2.xyz = (-u_xlat0.xyz) * vec3(u_xlat18) + _WorldSpaceCameraPos.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat18) + _LightPosWS.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb18 = unity_OrthoParams.w==0.0;
#endif
    u_xlat3.x = (u_xlatb18) ? u_xlat2.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat3.y = (u_xlatb18) ? u_xlat2.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat3.z = (u_xlatb18) ? u_xlat2.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_4.x = inversesqrt(u_xlat18);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 6.10351562e-05);
    u_xlat13 = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat13);
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = max(u_xlat13, 1.17549435e-38);
    u_xlat16_4.x = inversesqrt(u_xlat13);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_4.xxx;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat1.xy, 0.0);
    u_xlat16_4.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xxx;
    u_xlat13 = u_xlat10_3.w * 5.0 + 6.0;
    u_xlat13 = exp2(u_xlat13);
    u_xlat19 = dot(u_xlat16_4.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_4.x = dot(u_xlat16_4.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = dot(_LightDirection.xyz, u_xlat0.xyz);
    u_xlat16_10.x = u_xlat16_10.x * _LightAttenuation.z + _LightAttenuation.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_16 = log2(u_xlat19);
    u_xlat16_16 = u_xlat13 * u_xlat16_16;
    u_xlat16_16 = exp2(u_xlat16_16);
    u_xlat10_0.xyz = textureLod(_GBuffer1, u_xlat1.xy, 0.0).xyz;
    u_xlat10_1.xyz = textureLod(_GBuffer0, u_xlat1.xy, 0.0).xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_16) * u_xlat10_0.xyz;
    u_xlat0.x = float(1.0) / float(u_xlat18);
    u_xlat6 = u_xlat18 * _LightAttenuation.x + _LightAttenuation.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat6 * u_xlat0.x;
    u_xlat0.x = u_xlat16_10.x * u_xlat0.x;
    u_xlat16_10.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat16_10.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat10_1.xyz + u_xlat16_5.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
}
 Pass {
  Name "Deferred Directional Light (Lit)"
  Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  Blend One One, Zero One
  ZTest NotEqual
  ZWrite Off
  Cull Off
  Stencil {
   ReadMask 0
   WriteMask 0
   Comp Equal
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 254464
Program "vp" {
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DIRECTIONAL" "_LIT" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec2 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat5;
float u_xlat10;
mediump float u_xlat10_11;
float u_xlat15;
bool u_xlatb15;
mediump float u_xlat16_18;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat0;
    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_11 = textureLod(_CameraDepthTexture, u_xlat1.xy, 0.0).x;
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_11) + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat15 = float(1.0) / float(u_xlat0.w);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat15) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb15 = unity_OrthoParams.w==0.0;
#endif
    u_xlat2.x = (u_xlatb15) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb15) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb15) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat2.xyz * u_xlat16_3.xxx + _LightDirection.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat16_3.x = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.xxx;
    u_xlat10_2 = textureLod(_GBuffer2, u_xlat1.xy, 0.0);
    u_xlat16_3.x = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xxx;
    u_xlat15 = u_xlat10_2.w * 0.5 + 0.5;
    u_xlat16_18 = (-u_xlat15) + 1.0;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_18, 0.0078125);
    u_xlat15 = dot(u_xlat16_3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_LightDirection.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = max(u_xlat16_4.x, 0.100000001);
    u_xlat16_3.x = dot(u_xlat16_3.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xxx * _LightColor.xyz;
    u_xlat5 = u_xlat15 * u_xlat15;
    u_xlat10 = u_xlat16_18 * u_xlat16_18 + -1.0;
    u_xlat5 = u_xlat5 * u_xlat10 + 1.00001001;
    u_xlat5 = u_xlat5 * u_xlat5;
    u_xlat0.x = u_xlat0.x * u_xlat5;
    u_xlat5 = u_xlat16_18 * 4.0 + 2.0;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_18;
    u_xlat0.x = u_xlat5 * u_xlat0.x;
    u_xlat0.x = u_xlat16_18 / u_xlat0.x;
    u_xlat16_18 = u_xlat0.x + -6.10351562e-05;
    u_xlat16_18 = max(u_xlat16_18, 0.0);
    u_xlat16_18 = min(u_xlat16_18, 100.0);
    u_xlat10_0.xyz = textureLod(_GBuffer0, u_xlat1.xy, 0.0).xyz;
    u_xlat10_1.xyz = textureLod(_GBuffer1, u_xlat1.xy, 0.0).xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * vec3(u_xlat16_18) + u_xlat10_0.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DEFERRED_SUBTRACTIVE_LIGHTING" "_DIRECTIONAL" "_LIT" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
uniform 	int _LightFlags;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_13;
float u_xlat14;
mediump float u_xlat10_14;
int u_xlati14;
uint u_xlatu14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb22;
mediump float u_xlat16_26;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat14 = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu14 = uint(u_xlat14);
    u_xlati14 = int(uint(u_xlatu14 & uint(_LightFlags)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlati14==4);
#else
    u_xlatb14 = u_xlati14==4;
#endif
    if(u_xlatb14){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat10_14 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat4 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat4;
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_14) + u_xlat4;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat21 = float(1.0) / float(u_xlat0.w);
    u_xlat16_5.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat10_3.xyz * u_xlat16_5.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = (u_xlatb22) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat3.y = (u_xlatb22) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat3.z = (u_xlatb22) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_26 = inversesqrt(u_xlat0.x);
    u_xlat0.x = u_xlat10_3.w * 0.5 + 0.5;
    u_xlat16_6.x = (-u_xlat0.x) + 1.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0078125);
    u_xlat16_13 = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat0.x = u_xlat16_6.x * 4.0 + 2.0;
    u_xlat7 = u_xlat16_6.x * u_xlat16_6.x + -1.0;
    u_xlat16_6.x = dot(u_xlat16_5.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.xzw = u_xlat16_6.xxx * _LightColor.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_26) + _LightDirection.xyz;
    u_xlat14 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat14 = max(u_xlat14, 1.17549435e-38);
    u_xlat16_26 = inversesqrt(u_xlat14);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_26);
    u_xlat14 = dot(u_xlat16_5.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14 = min(max(u_xlat14, 0.0), 1.0);
#else
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
#endif
    u_xlat21 = dot(_LightDirection.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat7 = u_xlat14 * u_xlat7 + 1.00001001;
    u_xlat16_5.x = u_xlat21 * u_xlat21;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat14 = max(u_xlat16_5.x, 0.100000001);
    u_xlat7 = u_xlat14 * u_xlat7;
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat0.x = u_xlat16_13 / u_xlat0.x;
    u_xlat16_5.x = u_xlat0.x + -6.10351562e-05;
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.x = min(u_xlat16_5.x, 100.0);
    u_xlat16_5.xyz = u_xlat10_2.xyz * u_xlat16_5.xxx + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_6.xzw * u_xlat16_5.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DIRECTIONAL" "_GBUFFER_NORMALS_OCT" "_LIT" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec2 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec4 u_xlat10_2;
uvec3 u_xlatu2;
mediump float u_xlat16_3;
vec2 u_xlat4;
ivec2 u_xlati4;
bvec2 u_xlatb4;
mediump vec3 u_xlat16_5;
float u_xlat6;
mediump vec3 u_xlat16_9;
float u_xlat12;
vec2 u_xlat13;
mediump float u_xlat10_13;
uvec2 u_xlatu13;
float u_xlat18;
uint u_xlatu18;
bool u_xlatb18;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat0;
    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_13 = textureLod(_CameraDepthTexture, u_xlat1.xy, 0.0).x;
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_13) + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat18 = float(1.0) / float(u_xlat0.w);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat18) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb18 = unity_OrthoParams.w==0.0;
#endif
    u_xlat2.x = (u_xlatb18) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb18) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb18) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat16_3) + _LightDirection.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_3);
    u_xlat10_2 = textureLod(_GBuffer2, u_xlat1.xy, 0.0);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(255.5, 255.5, 255.5);
    u_xlat16_3 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_3;
    u_xlat16_3 = max(u_xlat16_3, 0.0078125);
    u_xlatu2.xyz = uvec3(u_xlat2.xyz);
    u_xlatu18 = uint(u_xlatu2.z >> 4u);
    u_xlati4.y = int(int(u_xlatu18) << 8);
    u_xlati4.x = int(int_bitfieldInsert(0,int(u_xlatu2.z),8,4) );
    u_xlatu13.xy = uvec2(u_xlatu2.x | uint(u_xlati4.x), u_xlatu2.y | uint(u_xlati4.y));
    u_xlat13.xy = vec2(u_xlatu13.xy);
    u_xlat13.xy = u_xlat13.xy * vec2(0.000488400517, 0.000488400517) + vec2(-1.0, -1.0);
    u_xlat18 = -abs(u_xlat13.x) + 1.0;
    u_xlat2.z = -abs(u_xlat13.y) + u_xlat18;
    u_xlat18 = max((-u_xlat2.z), 0.0);
    u_xlatb4.xy = greaterThanEqual(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat4.x = (u_xlatb4.x) ? (-float(u_xlat18)) : float(u_xlat18);
    u_xlat4.y = (u_xlatb4.y) ? (-float(u_xlat18)) : float(u_xlat18);
    u_xlat2.xy = u_xlat13.xy + u_xlat4.xy;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_LightDirection.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = max(u_xlat16_9.x, 0.100000001);
    u_xlat16_9.x = dot(u_xlat2.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_9.xxx * _LightColor.xyz;
    u_xlat6 = u_xlat18 * u_xlat18;
    u_xlat12 = u_xlat16_3 * u_xlat16_3 + -1.0;
    u_xlat6 = u_xlat6 * u_xlat12 + 1.00001001;
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat0.x = u_xlat0.x * u_xlat6;
    u_xlat6 = u_xlat16_3 * 4.0 + 2.0;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_3;
    u_xlat0.x = u_xlat6 * u_xlat0.x;
    u_xlat0.x = u_xlat16_3 / u_xlat0.x;
    u_xlat16_3 = u_xlat0.x + -6.10351562e-05;
    u_xlat16_3 = max(u_xlat16_3, 0.0);
    u_xlat16_3 = min(u_xlat16_3, 100.0);
    u_xlat10_0.xyz = textureLod(_GBuffer0, u_xlat1.xy, 0.0).xyz;
    u_xlat10_1.xyz = textureLod(_GBuffer1, u_xlat1.xy, 0.0).xyz;
    u_xlat16_5.xyz = u_xlat10_1.xyz * vec3(u_xlat16_3) + u_xlat10_0.xyz;
    SV_Target0.xyz = u_xlat16_9.xyz * u_xlat16_5.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DEFERRED_SUBTRACTIVE_LIGHTING" "_DIRECTIONAL" "_GBUFFER_NORMALS_OCT" "_LIT" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
uniform 	int _LightFlags;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
uvec3 u_xlatu3;
vec4 u_xlat4;
ivec2 u_xlati4;
vec2 u_xlat5;
bvec2 u_xlatb5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
mediump float u_xlat16_14;
float u_xlat16;
mediump float u_xlat10_16;
int u_xlati16;
uint u_xlatu16;
bool u_xlatb16;
mediump float u_xlat16_22;
float u_xlat24;
float u_xlat25;
uint u_xlatu25;
bool u_xlatb25;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat16 = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu16 = uint(u_xlat16);
    u_xlati16 = int(uint(u_xlatu16 & uint(_LightFlags)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlati16==4);
#else
    u_xlatb16 = u_xlati16==4;
#endif
    if(u_xlatb16){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat10_16 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat4 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat4;
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_16) + u_xlat4;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat24 = float(1.0) / float(u_xlat0.w);
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(255.5, 255.5, 255.5);
    u_xlatu3.xyz = uvec3(u_xlat3.xyz);
    u_xlatu25 = uint(u_xlatu3.z >> 4u);
    u_xlati4.x = int(int_bitfieldInsert(0,int(u_xlatu3.z),8,4) );
    u_xlati4.y = int(int(u_xlatu25) << 8);
    u_xlatu3.xy = uvec2(u_xlatu3.x | uint(u_xlati4.x), u_xlatu3.y | uint(u_xlati4.y));
    u_xlat3.xy = vec2(u_xlatu3.xy);
    u_xlat3.xy = u_xlat3.xy * vec2(0.000488400517, 0.000488400517) + vec2(-1.0, -1.0);
    u_xlat25 = -abs(u_xlat3.x) + 1.0;
    u_xlat4.z = -abs(u_xlat3.y) + u_xlat25;
    u_xlat25 = max((-u_xlat4.z), 0.0);
    u_xlatb5.xy = greaterThanEqual(u_xlat3.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat5.x = (u_xlatb5.x) ? (-float(u_xlat25)) : float(u_xlat25);
    u_xlat5.y = (u_xlatb5.y) ? (-float(u_xlat25)) : float(u_xlat25);
    u_xlat4.xy = u_xlat3.xy + u_xlat5.xy;
    u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb25 = unity_OrthoParams.w==0.0;
#endif
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat24) + _WorldSpaceCameraPos.xyz;
    u_xlat4.x = (u_xlatb25) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = (u_xlatb25) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = (u_xlatb25) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_6.x = inversesqrt(u_xlat0.x);
    u_xlat16_14 = (-u_xlat10_3.w) + 1.0;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_14;
    u_xlat16_14 = max(u_xlat16_14, 0.0078125);
    u_xlat16_22 = u_xlat16_14 * u_xlat16_14;
    u_xlat0.x = u_xlat16_14 * 4.0 + 2.0;
    u_xlat8 = u_xlat16_14 * u_xlat16_14 + -1.0;
    u_xlat16_14 = dot(u_xlat3.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14 = min(max(u_xlat16_14, 0.0), 1.0);
#else
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = vec3(u_xlat16_14) * _LightColor.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_6.xxx + _LightDirection.xyz;
    u_xlat16 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16_6.x = inversesqrt(u_xlat16);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_6.xxx;
    u_xlat16 = dot(u_xlat3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat24 = dot(_LightDirection.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat8 = u_xlat16 * u_xlat8 + 1.00001001;
    u_xlat16_6.x = u_xlat24 * u_xlat24;
    u_xlat8 = u_xlat8 * u_xlat8;
    u_xlat16 = max(u_xlat16_6.x, 0.100000001);
    u_xlat8 = u_xlat16 * u_xlat8;
    u_xlat0.x = u_xlat0.x * u_xlat8;
    u_xlat0.x = u_xlat16_22 / u_xlat0.x;
    u_xlat16_6.x = u_xlat0.x + -6.10351562e-05;
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = min(u_xlat16_6.x, 100.0);
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat16_6.xxx + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_6.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DEFERRED_SUBTRACTIVE_LIGHTING" "_DIRECTIONAL" "_GBUFFER_NORMALS_OCT" "_LIT" "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
uniform 	int _LightFlags;
UNITY_LOCATION(0) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(5) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
int u_xlati0;
uint u_xlatu0;
bool u_xlatb0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
uvec3 u_xlatu3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
ivec2 u_xlati6;
bvec4 u_xlatb6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
vec4 u_xlat11;
mediump vec3 u_xlat16_12;
float u_xlat13;
float u_xlat21;
mediump float u_xlat16_21;
vec2 u_xlat26;
uvec2 u_xlatu26;
bool u_xlatb26;
mediump float u_xlat16_34;
float u_xlat39;
mediump float u_xlat10_39;
int u_xlati39;
bool u_xlatb39;
float u_xlat40;
mediump float u_xlat16_47;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat26.x = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu26.x = uint(u_xlat26.x);
    u_xlati39 = int(uint(u_xlatu26.x & uint(_LightFlags)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(u_xlati39==4);
#else
    u_xlatb39 = u_xlati39==4;
#endif
    if(u_xlatb39){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat10_39 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlati0 = int(uint(u_xlatu26.x & 1u));
    u_xlat4 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_39) + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat13 = float(1.0) / float(u_xlat4.w);
    u_xlat5.xyz = vec3(u_xlat13) * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(255.5, 255.5, 255.5);
    u_xlatu3.xyz = uvec3(u_xlat3.xyz);
    u_xlatu26.x = uint(u_xlatu3.z >> 4u);
    u_xlati6.x = int(int_bitfieldInsert(0,int(u_xlatu3.z),8,4) );
    u_xlati6.y = int(int(u_xlatu26.x) << 8);
    u_xlatu26.xy = uvec2(u_xlatu3.x | uint(u_xlati6.x), u_xlatu3.y | uint(u_xlati6.y));
    u_xlat26.xy = vec2(u_xlatu26.xy);
    u_xlat26.xy = u_xlat26.xy * vec2(0.000488400517, 0.000488400517) + vec2(-1.0, -1.0);
    u_xlat40 = -abs(u_xlat26.x) + 1.0;
    u_xlat3.z = -abs(u_xlat26.y) + u_xlat40;
    u_xlat40 = max((-u_xlat3.z), 0.0);
    u_xlatb6.xy = greaterThanEqual(u_xlat26.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat6.x = (u_xlatb6.x) ? (-float(u_xlat40)) : float(u_xlat40);
    u_xlat6.y = (u_xlatb6.y) ? (-float(u_xlat40)) : float(u_xlat40);
    u_xlat3.xy = u_xlat26.xy + u_xlat6.xy;
    u_xlat26.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat3.xyz = u_xlat26.xxx * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb26 = unity_OrthoParams.w==0.0;
#endif
    u_xlat6.xyz = (-u_xlat4.xyz) * vec3(u_xlat13) + _WorldSpaceCameraPos.xyz;
    u_xlat7.x = (u_xlatb26) ? u_xlat6.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = (u_xlatb26) ? u_xlat6.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = (u_xlatb26) ? u_xlat6.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat26.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat16_8.x = inversesqrt(u_xlat26.x);
    if(u_xlati0 != 0) {
        u_xlat16_21 = 1.0;
    } else {
        u_xlat0.xzw = u_xlat4.xyz * vec3(u_xlat13) + (-_CascadeShadowSplitSpheres0.xyz);
        u_xlat6.xyz = u_xlat4.xyz * vec3(u_xlat13) + (-_CascadeShadowSplitSpheres1.xyz);
        u_xlat9.xyz = u_xlat4.xyz * vec3(u_xlat13) + (-_CascadeShadowSplitSpheres2.xyz);
        u_xlat10.xyz = u_xlat4.xyz * vec3(u_xlat13) + (-_CascadeShadowSplitSpheres3.xyz);
        u_xlat11.x = dot(u_xlat0.xzw, u_xlat0.xzw);
        u_xlat11.y = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat11.z = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlat11.w = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb6 = lessThan(u_xlat11, _CascadeShadowSplitSphereRadii);
        u_xlat16_9.x = (u_xlatb6.x) ? float(1.0) : float(0.0);
        u_xlat16_9.y = (u_xlatb6.y) ? float(1.0) : float(0.0);
        u_xlat16_9.z = (u_xlatb6.z) ? float(1.0) : float(0.0);
        u_xlat16_9.w = (u_xlatb6.w) ? float(1.0) : float(0.0);
        u_xlat16_12.x = (u_xlatb6.x) ? float(-1.0) : float(-0.0);
        u_xlat16_12.y = (u_xlatb6.y) ? float(-1.0) : float(-0.0);
        u_xlat16_12.z = (u_xlatb6.z) ? float(-1.0) : float(-0.0);
        u_xlat16_12.xyz = u_xlat16_9.yzw + u_xlat16_12.xyz;
        u_xlat16_9.yzw = max(u_xlat16_12.xyz, vec3(0.0, 0.0, 0.0));
        u_xlat16_34 = dot(u_xlat16_9, vec4(4.0, 3.0, 2.0, 1.0));
        u_xlat16_34 = (-u_xlat16_34) + 4.0;
        u_xlatu0 = uint(u_xlat16_34);
        u_xlati0 = int(int(u_xlatu0) << 2);
        u_xlat6.xyz = u_xlat5.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 1)].xyz;
        u_xlat5.xyw = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati0].xyz * u_xlat5.xxx + u_xlat6.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 2)].xyz * u_xlat5.zzz + u_xlat5.xyw;
        u_xlat0.xzw = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 3)].xyz;
        vec3 txVec0 = vec3(u_xlat0.xz,u_xlat0.w);
        u_xlat16_0 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
        u_xlat16_34 = (-_MainLightShadowParams.x) + 1.0;
        u_xlat16_34 = u_xlat16_0 * _MainLightShadowParams.x + u_xlat16_34;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(0.0>=u_xlat0.w);
#else
        u_xlatb0 = 0.0>=u_xlat0.w;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(u_xlat0.w>=1.0);
#else
        u_xlatb26 = u_xlat0.w>=1.0;
#endif
        u_xlatb0 = u_xlatb26 || u_xlatb0;
        u_xlat16_34 = (u_xlatb0) ? 1.0 : u_xlat16_34;
        u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat13) + (-_WorldSpaceCameraPos.xyz);
        u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat16_47 = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = (-u_xlat16_34) + 1.0;
        u_xlat0.x = u_xlat16_47 * u_xlat0.x;
        u_xlat21 = u_xlat0.x * u_xlat16_47 + u_xlat16_34;
        u_xlat16_21 = u_xlat21;
    }
    u_xlat16_34 = (-u_xlat10_3.w) + 1.0;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_34;
    u_xlat16_34 = max(u_xlat16_34, 0.0078125);
    u_xlat16_47 = u_xlat16_34 * u_xlat16_34;
    u_xlat0.x = u_xlat16_34 * 4.0 + 2.0;
    u_xlat13 = u_xlat16_34 * u_xlat16_34 + -1.0;
    u_xlat16_34 = dot(u_xlat3.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34 = min(max(u_xlat16_34, 0.0), 1.0);
#else
    u_xlat16_34 = clamp(u_xlat16_34, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_34 * u_xlat16_21;
    u_xlat16_12.xyz = vec3(u_xlat16_21) * _LightColor.xyz;
    u_xlat4.xyz = u_xlat7.xyz * u_xlat16_8.xxx + _LightDirection.xyz;
    u_xlat26.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat16_8.x = inversesqrt(u_xlat26.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_8.xxx;
    u_xlat26.x = dot(u_xlat3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat39 = dot(_LightDirection.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat13 = u_xlat26.x * u_xlat13 + 1.00001001;
    u_xlat16_8.x = u_xlat39 * u_xlat39;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat26.x = max(u_xlat16_8.x, 0.100000001);
    u_xlat13 = u_xlat26.x * u_xlat13;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat0.x = u_xlat16_47 / u_xlat0.x;
    u_xlat16_8.x = u_xlat0.x + -6.10351562e-05;
    u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
    u_xlat16_8.x = min(u_xlat16_8.x, 100.0);
    u_xlat16_8.xyz = u_xlat10_2.xyz * u_xlat16_8.xxx + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_12.xyz * u_xlat16_8.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DIRECTIONAL" "_GBUFFER_NORMALS_OCT" "_LIT" "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
UNITY_LOCATION(0) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(5) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
int u_xlati0;
uint u_xlatu0;
bool u_xlatb0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
uvec3 u_xlatu3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
ivec2 u_xlati6;
bvec4 u_xlatb6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
vec4 u_xlat11;
mediump vec3 u_xlat16_12;
float u_xlat13;
float u_xlat21;
mediump float u_xlat16_21;
vec2 u_xlat26;
mediump float u_xlat10_26;
uvec2 u_xlatu26;
bool u_xlatb26;
mediump float u_xlat16_34;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_47;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_26 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat0.x = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlati0 = int(uint(u_xlatu0 & 1u));
    u_xlat4 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_26) + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat13 = float(1.0) / float(u_xlat4.w);
    u_xlat5.xyz = vec3(u_xlat13) * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(255.5, 255.5, 255.5);
    u_xlatu3.xyz = uvec3(u_xlat3.xyz);
    u_xlatu26.x = uint(u_xlatu3.z >> 4u);
    u_xlati6.x = int(int_bitfieldInsert(0,int(u_xlatu3.z),8,4) );
    u_xlati6.y = int(int(u_xlatu26.x) << 8);
    u_xlatu26.xy = uvec2(u_xlatu3.x | uint(u_xlati6.x), u_xlatu3.y | uint(u_xlati6.y));
    u_xlat26.xy = vec2(u_xlatu26.xy);
    u_xlat26.xy = u_xlat26.xy * vec2(0.000488400517, 0.000488400517) + vec2(-1.0, -1.0);
    u_xlat40 = -abs(u_xlat26.x) + 1.0;
    u_xlat3.z = -abs(u_xlat26.y) + u_xlat40;
    u_xlat40 = max((-u_xlat3.z), 0.0);
    u_xlatb6.xy = greaterThanEqual(u_xlat26.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat6.x = (u_xlatb6.x) ? (-float(u_xlat40)) : float(u_xlat40);
    u_xlat6.y = (u_xlatb6.y) ? (-float(u_xlat40)) : float(u_xlat40);
    u_xlat3.xy = u_xlat26.xy + u_xlat6.xy;
    u_xlat26.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat3.xyz = u_xlat26.xxx * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb26 = unity_OrthoParams.w==0.0;
#endif
    u_xlat6.xyz = (-u_xlat4.xyz) * vec3(u_xlat13) + _WorldSpaceCameraPos.xyz;
    u_xlat7.x = (u_xlatb26) ? u_xlat6.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = (u_xlatb26) ? u_xlat6.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = (u_xlatb26) ? u_xlat6.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat26.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat16_8.x = inversesqrt(u_xlat26.x);
    if(u_xlati0 != 0) {
        u_xlat16_21 = 1.0;
    } else {
        u_xlat0.xzw = u_xlat4.xyz * vec3(u_xlat13) + (-_CascadeShadowSplitSpheres0.xyz);
        u_xlat6.xyz = u_xlat4.xyz * vec3(u_xlat13) + (-_CascadeShadowSplitSpheres1.xyz);
        u_xlat9.xyz = u_xlat4.xyz * vec3(u_xlat13) + (-_CascadeShadowSplitSpheres2.xyz);
        u_xlat10.xyz = u_xlat4.xyz * vec3(u_xlat13) + (-_CascadeShadowSplitSpheres3.xyz);
        u_xlat11.x = dot(u_xlat0.xzw, u_xlat0.xzw);
        u_xlat11.y = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat11.z = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlat11.w = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb6 = lessThan(u_xlat11, _CascadeShadowSplitSphereRadii);
        u_xlat16_9.x = (u_xlatb6.x) ? float(1.0) : float(0.0);
        u_xlat16_9.y = (u_xlatb6.y) ? float(1.0) : float(0.0);
        u_xlat16_9.z = (u_xlatb6.z) ? float(1.0) : float(0.0);
        u_xlat16_9.w = (u_xlatb6.w) ? float(1.0) : float(0.0);
        u_xlat16_12.x = (u_xlatb6.x) ? float(-1.0) : float(-0.0);
        u_xlat16_12.y = (u_xlatb6.y) ? float(-1.0) : float(-0.0);
        u_xlat16_12.z = (u_xlatb6.z) ? float(-1.0) : float(-0.0);
        u_xlat16_12.xyz = u_xlat16_9.yzw + u_xlat16_12.xyz;
        u_xlat16_9.yzw = max(u_xlat16_12.xyz, vec3(0.0, 0.0, 0.0));
        u_xlat16_34 = dot(u_xlat16_9, vec4(4.0, 3.0, 2.0, 1.0));
        u_xlat16_34 = (-u_xlat16_34) + 4.0;
        u_xlatu0 = uint(u_xlat16_34);
        u_xlati0 = int(int(u_xlatu0) << 2);
        u_xlat6.xyz = u_xlat5.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 1)].xyz;
        u_xlat5.xyw = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati0].xyz * u_xlat5.xxx + u_xlat6.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 2)].xyz * u_xlat5.zzz + u_xlat5.xyw;
        u_xlat0.xzw = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 3)].xyz;
        vec3 txVec0 = vec3(u_xlat0.xz,u_xlat0.w);
        u_xlat16_0 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
        u_xlat16_34 = (-_MainLightShadowParams.x) + 1.0;
        u_xlat16_34 = u_xlat16_0 * _MainLightShadowParams.x + u_xlat16_34;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(0.0>=u_xlat0.w);
#else
        u_xlatb0 = 0.0>=u_xlat0.w;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(u_xlat0.w>=1.0);
#else
        u_xlatb26 = u_xlat0.w>=1.0;
#endif
        u_xlatb0 = u_xlatb26 || u_xlatb0;
        u_xlat16_34 = (u_xlatb0) ? 1.0 : u_xlat16_34;
        u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat13) + (-_WorldSpaceCameraPos.xyz);
        u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat16_47 = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = (-u_xlat16_34) + 1.0;
        u_xlat0.x = u_xlat16_47 * u_xlat0.x;
        u_xlat21 = u_xlat0.x * u_xlat16_47 + u_xlat16_34;
        u_xlat16_21 = u_xlat21;
    }
    u_xlat16_34 = (-u_xlat10_3.w) + 1.0;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_34;
    u_xlat16_34 = max(u_xlat16_34, 0.0078125);
    u_xlat16_47 = u_xlat16_34 * u_xlat16_34;
    u_xlat0.x = u_xlat16_34 * 4.0 + 2.0;
    u_xlat13 = u_xlat16_34 * u_xlat16_34 + -1.0;
    u_xlat16_34 = dot(u_xlat3.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34 = min(max(u_xlat16_34, 0.0), 1.0);
#else
    u_xlat16_34 = clamp(u_xlat16_34, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_34 * u_xlat16_21;
    u_xlat16_12.xyz = vec3(u_xlat16_21) * _LightColor.xyz;
    u_xlat4.xyz = u_xlat7.xyz * u_xlat16_8.xxx + _LightDirection.xyz;
    u_xlat26.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat16_8.x = inversesqrt(u_xlat26.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_8.xxx;
    u_xlat26.x = dot(u_xlat3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat39 = dot(_LightDirection.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat26.x = u_xlat26.x * u_xlat26.x;
    u_xlat13 = u_xlat26.x * u_xlat13 + 1.00001001;
    u_xlat16_8.x = u_xlat39 * u_xlat39;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat26.x = max(u_xlat16_8.x, 0.100000001);
    u_xlat13 = u_xlat26.x * u_xlat13;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat0.x = u_xlat16_47 / u_xlat0.x;
    u_xlat16_8.x = u_xlat0.x + -6.10351562e-05;
    u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
    u_xlat16_8.x = min(u_xlat16_8.x, 100.0);
    u_xlat16_8.xyz = u_xlat10_2.xyz * u_xlat16_8.xxx + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_12.xyz * u_xlat16_8.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DEFERRED_SUBTRACTIVE_LIGHTING" "_DIRECTIONAL" "_LIT" "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
uniform 	int _LightFlags;
UNITY_LOCATION(0) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(5) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
int u_xlati0;
uint u_xlatu0;
bool u_xlatb0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
bvec4 u_xlatb9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec4 u_xlat11;
float u_xlat12;
mediump vec3 u_xlat16_20;
float u_xlat24;
uint u_xlatu24;
bool u_xlatb24;
mediump float u_xlat16_32;
float u_xlat36;
mediump float u_xlat10_36;
int u_xlati36;
bool u_xlatb36;
mediump float u_xlat16_42;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat24 = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu24 = uint(u_xlat24);
    u_xlati36 = int(uint(u_xlatu24 & uint(_LightFlags)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlati36==4);
#else
    u_xlatb36 = u_xlati36==4;
#endif
    if(u_xlatb36){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat10_36 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlati0 = int(uint(u_xlatu24 & 1u));
    u_xlat4 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_36) + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat12 = float(1.0) / float(u_xlat4.w);
    u_xlat5.xyz = vec3(u_xlat12) * u_xlat4.xyz;
    u_xlat16_6.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat10_3.xyz * u_xlat16_6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb24 = unity_OrthoParams.w==0.0;
#endif
    u_xlat3.xyz = (-u_xlat4.xyz) * vec3(u_xlat12) + _WorldSpaceCameraPos.xyz;
    u_xlat7.x = (u_xlatb24) ? u_xlat3.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = (u_xlatb24) ? u_xlat3.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = (u_xlatb24) ? u_xlat3.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat24 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat16_42 = inversesqrt(u_xlat24);
    if(u_xlati0 != 0) {
        u_xlat16_8.x = 1.0;
    } else {
        u_xlat0.xzw = u_xlat4.xyz * vec3(u_xlat12) + (-_CascadeShadowSplitSpheres0.xyz);
        u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat12) + (-_CascadeShadowSplitSpheres1.xyz);
        u_xlat9.xyz = u_xlat4.xyz * vec3(u_xlat12) + (-_CascadeShadowSplitSpheres2.xyz);
        u_xlat10.xyz = u_xlat4.xyz * vec3(u_xlat12) + (-_CascadeShadowSplitSpheres3.xyz);
        u_xlat11.x = dot(u_xlat0.xzw, u_xlat0.xzw);
        u_xlat11.y = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat11.z = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlat11.w = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb9 = lessThan(u_xlat11, _CascadeShadowSplitSphereRadii);
        u_xlat16_10.x = (u_xlatb9.x) ? float(1.0) : float(0.0);
        u_xlat16_10.y = (u_xlatb9.y) ? float(1.0) : float(0.0);
        u_xlat16_10.z = (u_xlatb9.z) ? float(1.0) : float(0.0);
        u_xlat16_10.w = (u_xlatb9.w) ? float(1.0) : float(0.0);
        u_xlat16_20.x = (u_xlatb9.x) ? float(-1.0) : float(-0.0);
        u_xlat16_20.y = (u_xlatb9.y) ? float(-1.0) : float(-0.0);
        u_xlat16_20.z = (u_xlatb9.z) ? float(-1.0) : float(-0.0);
        u_xlat16_20.xyz = u_xlat16_20.xyz + u_xlat16_10.yzw;
        u_xlat16_10.yzw = max(u_xlat16_20.xyz, vec3(0.0, 0.0, 0.0));
        u_xlat16_20.x = dot(u_xlat16_10, vec4(4.0, 3.0, 2.0, 1.0));
        u_xlat16_20.x = (-u_xlat16_20.x) + 4.0;
        u_xlatu0 = uint(u_xlat16_20.x);
        u_xlati0 = int(int(u_xlatu0) << 2);
        u_xlat3.xyz = u_xlat5.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 1)].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati0].xyz * u_xlat5.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 2)].xyz * u_xlat5.zzz + u_xlat3.xyz;
        u_xlat0.xzw = u_xlat3.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 3)].xyz;
        vec3 txVec0 = vec3(u_xlat0.xz,u_xlat0.w);
        u_xlat16_0 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
        u_xlat16_20.x = (-_MainLightShadowParams.x) + 1.0;
        u_xlat16_20.x = u_xlat16_0 * _MainLightShadowParams.x + u_xlat16_20.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(0.0>=u_xlat0.w);
#else
        u_xlatb0 = 0.0>=u_xlat0.w;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat0.w>=1.0);
#else
        u_xlatb24 = u_xlat0.w>=1.0;
#endif
        u_xlatb0 = u_xlatb24 || u_xlatb0;
        u_xlat16_20.x = (u_xlatb0) ? 1.0 : u_xlat16_20.x;
        u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat12) + (-_WorldSpaceCameraPos.xyz);
        u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat16_32 = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = (-u_xlat16_20.x) + 1.0;
        u_xlat0.x = u_xlat16_32 * u_xlat0.x;
        u_xlat8 = u_xlat0.x * u_xlat16_32 + u_xlat16_20.x;
        u_xlat16_8.x = u_xlat8;
    }
    u_xlat0.x = u_xlat10_3.w * 0.5 + 0.5;
    u_xlat16_20.x = (-u_xlat0.x) + 1.0;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat16_32 = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat0.x = u_xlat16_20.x * 4.0 + 2.0;
    u_xlat12 = u_xlat16_20.x * u_xlat16_20.x + -1.0;
    u_xlat16_20.x = dot(u_xlat16_6.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.x = min(max(u_xlat16_20.x, 0.0), 1.0);
#else
    u_xlat16_20.x = clamp(u_xlat16_20.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_20.x * u_xlat16_8.x;
    u_xlat16_8.xyw = u_xlat16_8.xxx * _LightColor.xyz;
    u_xlat3.xyz = u_xlat7.xyz * vec3(u_xlat16_42) + _LightDirection.xyz;
    u_xlat24 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat16_42 = inversesqrt(u_xlat24);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_42);
    u_xlat24 = dot(u_xlat16_6.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat36 = dot(_LightDirection.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat12 = u_xlat24 * u_xlat12 + 1.00001001;
    u_xlat16_6.x = u_xlat36 * u_xlat36;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat24 = max(u_xlat16_6.x, 0.100000001);
    u_xlat12 = u_xlat24 * u_xlat12;
    u_xlat0.x = u_xlat0.x * u_xlat12;
    u_xlat0.x = u_xlat16_32 / u_xlat0.x;
    u_xlat16_6.x = u_xlat0.x + -6.10351562e-05;
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = min(u_xlat16_6.x, 100.0);
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat16_6.xxx + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_8.xyw * u_xlat16_6.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DIRECTIONAL" "_LIT" "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
UNITY_LOCATION(0) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(5) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
int u_xlati0;
uint u_xlatu0;
bool u_xlatb0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
bvec4 u_xlatb9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec4 u_xlat11;
float u_xlat12;
mediump vec3 u_xlat16_20;
float u_xlat24;
mediump float u_xlat10_24;
bool u_xlatb24;
mediump float u_xlat16_32;
float u_xlat36;
mediump float u_xlat16_42;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_24 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat0.x = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlati0 = int(uint(u_xlatu0 & 1u));
    u_xlat4 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_24) + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat12 = float(1.0) / float(u_xlat4.w);
    u_xlat5.xyz = vec3(u_xlat12) * u_xlat4.xyz;
    u_xlat16_6.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat10_3.xyz * u_xlat16_6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb24 = unity_OrthoParams.w==0.0;
#endif
    u_xlat3.xyz = (-u_xlat4.xyz) * vec3(u_xlat12) + _WorldSpaceCameraPos.xyz;
    u_xlat7.x = (u_xlatb24) ? u_xlat3.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = (u_xlatb24) ? u_xlat3.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = (u_xlatb24) ? u_xlat3.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat24 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat16_42 = inversesqrt(u_xlat24);
    if(u_xlati0 != 0) {
        u_xlat16_8.x = 1.0;
    } else {
        u_xlat0.xzw = u_xlat4.xyz * vec3(u_xlat12) + (-_CascadeShadowSplitSpheres0.xyz);
        u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat12) + (-_CascadeShadowSplitSpheres1.xyz);
        u_xlat9.xyz = u_xlat4.xyz * vec3(u_xlat12) + (-_CascadeShadowSplitSpheres2.xyz);
        u_xlat10.xyz = u_xlat4.xyz * vec3(u_xlat12) + (-_CascadeShadowSplitSpheres3.xyz);
        u_xlat11.x = dot(u_xlat0.xzw, u_xlat0.xzw);
        u_xlat11.y = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat11.z = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlat11.w = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb9 = lessThan(u_xlat11, _CascadeShadowSplitSphereRadii);
        u_xlat16_10.x = (u_xlatb9.x) ? float(1.0) : float(0.0);
        u_xlat16_10.y = (u_xlatb9.y) ? float(1.0) : float(0.0);
        u_xlat16_10.z = (u_xlatb9.z) ? float(1.0) : float(0.0);
        u_xlat16_10.w = (u_xlatb9.w) ? float(1.0) : float(0.0);
        u_xlat16_20.x = (u_xlatb9.x) ? float(-1.0) : float(-0.0);
        u_xlat16_20.y = (u_xlatb9.y) ? float(-1.0) : float(-0.0);
        u_xlat16_20.z = (u_xlatb9.z) ? float(-1.0) : float(-0.0);
        u_xlat16_20.xyz = u_xlat16_20.xyz + u_xlat16_10.yzw;
        u_xlat16_10.yzw = max(u_xlat16_20.xyz, vec3(0.0, 0.0, 0.0));
        u_xlat16_20.x = dot(u_xlat16_10, vec4(4.0, 3.0, 2.0, 1.0));
        u_xlat16_20.x = (-u_xlat16_20.x) + 4.0;
        u_xlatu0 = uint(u_xlat16_20.x);
        u_xlati0 = int(int(u_xlatu0) << 2);
        u_xlat3.xyz = u_xlat5.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 1)].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati0].xyz * u_xlat5.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 2)].xyz * u_xlat5.zzz + u_xlat3.xyz;
        u_xlat0.xzw = u_xlat3.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 3)].xyz;
        vec3 txVec0 = vec3(u_xlat0.xz,u_xlat0.w);
        u_xlat16_0 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
        u_xlat16_20.x = (-_MainLightShadowParams.x) + 1.0;
        u_xlat16_20.x = u_xlat16_0 * _MainLightShadowParams.x + u_xlat16_20.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(0.0>=u_xlat0.w);
#else
        u_xlatb0 = 0.0>=u_xlat0.w;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat0.w>=1.0);
#else
        u_xlatb24 = u_xlat0.w>=1.0;
#endif
        u_xlatb0 = u_xlatb24 || u_xlatb0;
        u_xlat16_20.x = (u_xlatb0) ? 1.0 : u_xlat16_20.x;
        u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat12) + (-_WorldSpaceCameraPos.xyz);
        u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat16_32 = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = (-u_xlat16_20.x) + 1.0;
        u_xlat0.x = u_xlat16_32 * u_xlat0.x;
        u_xlat8 = u_xlat0.x * u_xlat16_32 + u_xlat16_20.x;
        u_xlat16_8.x = u_xlat8;
    }
    u_xlat0.x = u_xlat10_3.w * 0.5 + 0.5;
    u_xlat16_20.x = (-u_xlat0.x) + 1.0;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = max(u_xlat16_20.x, 0.0078125);
    u_xlat16_32 = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat0.x = u_xlat16_20.x * 4.0 + 2.0;
    u_xlat12 = u_xlat16_20.x * u_xlat16_20.x + -1.0;
    u_xlat16_20.x = dot(u_xlat16_6.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.x = min(max(u_xlat16_20.x, 0.0), 1.0);
#else
    u_xlat16_20.x = clamp(u_xlat16_20.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_20.x * u_xlat16_8.x;
    u_xlat16_8.xyw = u_xlat16_8.xxx * _LightColor.xyz;
    u_xlat3.xyz = u_xlat7.xyz * vec3(u_xlat16_42) + _LightDirection.xyz;
    u_xlat24 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat16_42 = inversesqrt(u_xlat24);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_42);
    u_xlat24 = dot(u_xlat16_6.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat36 = dot(_LightDirection.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat12 = u_xlat24 * u_xlat12 + 1.00001001;
    u_xlat16_6.x = u_xlat36 * u_xlat36;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat24 = max(u_xlat16_6.x, 0.100000001);
    u_xlat12 = u_xlat24 * u_xlat12;
    u_xlat0.x = u_xlat0.x * u_xlat12;
    u_xlat0.x = u_xlat16_32 / u_xlat0.x;
    u_xlat16_6.x = u_xlat0.x + -6.10351562e-05;
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = min(u_xlat16_6.x, 100.0);
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat16_6.xxx + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_8.xyw * u_xlat16_6.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DEFERRED_SUBTRACTIVE_LIGHTING" "_DIRECTIONAL" "_GBUFFER_NORMALS_OCT" "_LIT" "_MAIN_LIGHT_SHADOWS" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	mediump vec4 _MainLightShadowParams;
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
uniform 	int _LightFlags;
UNITY_LOCATION(0) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(5) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
uvec3 u_xlatu3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
ivec2 u_xlati6;
bvec2 u_xlatb6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
float u_xlat10;
float u_xlat18;
mediump float u_xlat16_18;
vec2 u_xlat20;
uvec2 u_xlatu20;
bool u_xlatb20;
mediump float u_xlat16_28;
float u_xlat30;
mediump float u_xlat10_30;
int u_xlati30;
bool u_xlatb30;
float u_xlat31;
mediump float u_xlat16_38;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat20.x = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu20.x = uint(u_xlat20.x);
    u_xlati30 = int(uint(u_xlatu20.x & uint(_LightFlags)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(u_xlati30==4);
#else
    u_xlatb30 = u_xlati30==4;
#endif
    if(u_xlatb30){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat10_30 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlati0 = int(uint(u_xlatu20.x & 1u));
    u_xlat4 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_30) + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat10 = float(1.0) / float(u_xlat4.w);
    u_xlat5.xyz = vec3(u_xlat10) * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(255.5, 255.5, 255.5);
    u_xlatu3.xyz = uvec3(u_xlat3.xyz);
    u_xlatu20.x = uint(u_xlatu3.z >> 4u);
    u_xlati6.x = int(int_bitfieldInsert(0,int(u_xlatu3.z),8,4) );
    u_xlati6.y = int(int(u_xlatu20.x) << 8);
    u_xlatu20.xy = uvec2(u_xlatu3.x | uint(u_xlati6.x), u_xlatu3.y | uint(u_xlati6.y));
    u_xlat20.xy = vec2(u_xlatu20.xy);
    u_xlat20.xy = u_xlat20.xy * vec2(0.000488400517, 0.000488400517) + vec2(-1.0, -1.0);
    u_xlat31 = -abs(u_xlat20.x) + 1.0;
    u_xlat3.z = -abs(u_xlat20.y) + u_xlat31;
    u_xlat31 = max((-u_xlat3.z), 0.0);
    u_xlatb6.xy = greaterThanEqual(u_xlat20.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat6.x = (u_xlatb6.x) ? (-float(u_xlat31)) : float(u_xlat31);
    u_xlat6.y = (u_xlatb6.y) ? (-float(u_xlat31)) : float(u_xlat31);
    u_xlat3.xy = u_xlat20.xy + u_xlat6.xy;
    u_xlat20.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat20.x = inversesqrt(u_xlat20.x);
    u_xlat3.xyz = u_xlat20.xxx * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb20 = unity_OrthoParams.w==0.0;
#endif
    u_xlat6.xyz = (-u_xlat4.xyz) * vec3(u_xlat10) + _WorldSpaceCameraPos.xyz;
    u_xlat7.x = (u_xlatb20) ? u_xlat6.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = (u_xlatb20) ? u_xlat6.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = (u_xlatb20) ? u_xlat6.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat20.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat20.x = max(u_xlat20.x, 1.17549435e-38);
    u_xlat16_8.x = inversesqrt(u_xlat20.x);
    if(u_xlati0 != 0) {
        u_xlat16_18 = 1.0;
    } else {
        u_xlat0.xzw = u_xlat5.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
        u_xlat0.xzw = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat5.xxx + u_xlat0.xzw;
        u_xlat0.xzw = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat5.zzz + u_xlat0.xzw;
        u_xlat0.xzw = u_xlat0.xzw + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
        vec3 txVec0 = vec3(u_xlat0.xz,u_xlat0.w);
        u_xlat16_0 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
        u_xlat16_28 = (-_MainLightShadowParams.x) + 1.0;
        u_xlat16_28 = u_xlat16_0 * _MainLightShadowParams.x + u_xlat16_28;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(0.0>=u_xlat0.w);
#else
        u_xlatb0 = 0.0>=u_xlat0.w;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb20 = !!(u_xlat0.w>=1.0);
#else
        u_xlatb20 = u_xlat0.w>=1.0;
#endif
        u_xlatb0 = u_xlatb20 || u_xlatb0;
        u_xlat16_28 = (u_xlatb0) ? 1.0 : u_xlat16_28;
        u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat10) + (-_WorldSpaceCameraPos.xyz);
        u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat16_38 = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = (-u_xlat16_28) + 1.0;
        u_xlat0.x = u_xlat16_38 * u_xlat0.x;
        u_xlat18 = u_xlat0.x * u_xlat16_38 + u_xlat16_28;
        u_xlat16_18 = u_xlat18;
    }
    u_xlat16_28 = (-u_xlat10_3.w) + 1.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = max(u_xlat16_28, 0.0078125);
    u_xlat16_38 = u_xlat16_28 * u_xlat16_28;
    u_xlat0.x = u_xlat16_28 * 4.0 + 2.0;
    u_xlat10 = u_xlat16_28 * u_xlat16_28 + -1.0;
    u_xlat16_28 = dot(u_xlat3.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_18 = u_xlat16_28 * u_xlat16_18;
    u_xlat16_9.xyz = vec3(u_xlat16_18) * _LightColor.xyz;
    u_xlat4.xyz = u_xlat7.xyz * u_xlat16_8.xxx + _LightDirection.xyz;
    u_xlat20.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat20.x = max(u_xlat20.x, 1.17549435e-38);
    u_xlat16_8.x = inversesqrt(u_xlat20.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_8.xxx;
    u_xlat20.x = dot(u_xlat3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat30 = dot(_LightDirection.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat20.x = u_xlat20.x * u_xlat20.x;
    u_xlat10 = u_xlat20.x * u_xlat10 + 1.00001001;
    u_xlat16_8.x = u_xlat30 * u_xlat30;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat20.x = max(u_xlat16_8.x, 0.100000001);
    u_xlat10 = u_xlat20.x * u_xlat10;
    u_xlat0.x = u_xlat0.x * u_xlat10;
    u_xlat0.x = u_xlat16_38 / u_xlat0.x;
    u_xlat16_8.x = u_xlat0.x + -6.10351562e-05;
    u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
    u_xlat16_8.x = min(u_xlat16_8.x, 100.0);
    u_xlat16_8.xyz = u_xlat10_2.xyz * u_xlat16_8.xxx + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_9.xyz * u_xlat16_8.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DIRECTIONAL" "_GBUFFER_NORMALS_OCT" "_LIT" "_MAIN_LIGHT_SHADOWS" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	mediump vec4 _MainLightShadowParams;
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
UNITY_LOCATION(0) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(5) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
int u_xlati0;
uint u_xlatu0;
bool u_xlatb0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
uvec3 u_xlatu3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
ivec2 u_xlati6;
bvec2 u_xlatb6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
float u_xlat10;
float u_xlat18;
mediump float u_xlat16_18;
vec2 u_xlat20;
mediump float u_xlat10_20;
uvec2 u_xlatu20;
bool u_xlatb20;
mediump float u_xlat16_28;
float u_xlat30;
float u_xlat31;
mediump float u_xlat16_38;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_20 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat0.x = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlati0 = int(uint(u_xlatu0 & 1u));
    u_xlat4 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_20) + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat10 = float(1.0) / float(u_xlat4.w);
    u_xlat5.xyz = vec3(u_xlat10) * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(255.5, 255.5, 255.5);
    u_xlatu3.xyz = uvec3(u_xlat3.xyz);
    u_xlatu20.x = uint(u_xlatu3.z >> 4u);
    u_xlati6.x = int(int_bitfieldInsert(0,int(u_xlatu3.z),8,4) );
    u_xlati6.y = int(int(u_xlatu20.x) << 8);
    u_xlatu20.xy = uvec2(u_xlatu3.x | uint(u_xlati6.x), u_xlatu3.y | uint(u_xlati6.y));
    u_xlat20.xy = vec2(u_xlatu20.xy);
    u_xlat20.xy = u_xlat20.xy * vec2(0.000488400517, 0.000488400517) + vec2(-1.0, -1.0);
    u_xlat31 = -abs(u_xlat20.x) + 1.0;
    u_xlat3.z = -abs(u_xlat20.y) + u_xlat31;
    u_xlat31 = max((-u_xlat3.z), 0.0);
    u_xlatb6.xy = greaterThanEqual(u_xlat20.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat6.x = (u_xlatb6.x) ? (-float(u_xlat31)) : float(u_xlat31);
    u_xlat6.y = (u_xlatb6.y) ? (-float(u_xlat31)) : float(u_xlat31);
    u_xlat3.xy = u_xlat20.xy + u_xlat6.xy;
    u_xlat20.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat20.x = inversesqrt(u_xlat20.x);
    u_xlat3.xyz = u_xlat20.xxx * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb20 = unity_OrthoParams.w==0.0;
#endif
    u_xlat6.xyz = (-u_xlat4.xyz) * vec3(u_xlat10) + _WorldSpaceCameraPos.xyz;
    u_xlat7.x = (u_xlatb20) ? u_xlat6.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = (u_xlatb20) ? u_xlat6.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = (u_xlatb20) ? u_xlat6.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat20.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat20.x = max(u_xlat20.x, 1.17549435e-38);
    u_xlat16_8.x = inversesqrt(u_xlat20.x);
    if(u_xlati0 != 0) {
        u_xlat16_18 = 1.0;
    } else {
        u_xlat0.xzw = u_xlat5.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
        u_xlat0.xzw = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat5.xxx + u_xlat0.xzw;
        u_xlat0.xzw = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat5.zzz + u_xlat0.xzw;
        u_xlat0.xzw = u_xlat0.xzw + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
        vec3 txVec0 = vec3(u_xlat0.xz,u_xlat0.w);
        u_xlat16_0 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
        u_xlat16_28 = (-_MainLightShadowParams.x) + 1.0;
        u_xlat16_28 = u_xlat16_0 * _MainLightShadowParams.x + u_xlat16_28;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(0.0>=u_xlat0.w);
#else
        u_xlatb0 = 0.0>=u_xlat0.w;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb20 = !!(u_xlat0.w>=1.0);
#else
        u_xlatb20 = u_xlat0.w>=1.0;
#endif
        u_xlatb0 = u_xlatb20 || u_xlatb0;
        u_xlat16_28 = (u_xlatb0) ? 1.0 : u_xlat16_28;
        u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat10) + (-_WorldSpaceCameraPos.xyz);
        u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat16_38 = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = (-u_xlat16_28) + 1.0;
        u_xlat0.x = u_xlat16_38 * u_xlat0.x;
        u_xlat18 = u_xlat0.x * u_xlat16_38 + u_xlat16_28;
        u_xlat16_18 = u_xlat18;
    }
    u_xlat16_28 = (-u_xlat10_3.w) + 1.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = max(u_xlat16_28, 0.0078125);
    u_xlat16_38 = u_xlat16_28 * u_xlat16_28;
    u_xlat0.x = u_xlat16_28 * 4.0 + 2.0;
    u_xlat10 = u_xlat16_28 * u_xlat16_28 + -1.0;
    u_xlat16_28 = dot(u_xlat3.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_18 = u_xlat16_28 * u_xlat16_18;
    u_xlat16_9.xyz = vec3(u_xlat16_18) * _LightColor.xyz;
    u_xlat4.xyz = u_xlat7.xyz * u_xlat16_8.xxx + _LightDirection.xyz;
    u_xlat20.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat20.x = max(u_xlat20.x, 1.17549435e-38);
    u_xlat16_8.x = inversesqrt(u_xlat20.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_8.xxx;
    u_xlat20.x = dot(u_xlat3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat30 = dot(_LightDirection.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat20.x = u_xlat20.x * u_xlat20.x;
    u_xlat10 = u_xlat20.x * u_xlat10 + 1.00001001;
    u_xlat16_8.x = u_xlat30 * u_xlat30;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat20.x = max(u_xlat16_8.x, 0.100000001);
    u_xlat10 = u_xlat20.x * u_xlat10;
    u_xlat0.x = u_xlat0.x * u_xlat10;
    u_xlat0.x = u_xlat16_38 / u_xlat0.x;
    u_xlat16_8.x = u_xlat0.x + -6.10351562e-05;
    u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
    u_xlat16_8.x = min(u_xlat16_8.x, 100.0);
    u_xlat16_8.xyz = u_xlat10_2.xyz * u_xlat16_8.xxx + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_9.xyz * u_xlat16_8.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DEFERRED_SUBTRACTIVE_LIGHTING" "_DIRECTIONAL" "_LIT" "_MAIN_LIGHT_SHADOWS" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	mediump vec4 _MainLightShadowParams;
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
uniform 	int _LightFlags;
UNITY_LOCATION(0) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(5) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
mediump vec4 u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_17;
float u_xlat18;
uint u_xlatu18;
bool u_xlatb18;
mediump float u_xlat16_26;
float u_xlat27;
mediump float u_xlat10_27;
int u_xlati27;
bool u_xlatb27;
mediump float u_xlat16_33;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat18 = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu18 = uint(u_xlat18);
    u_xlati27 = int(uint(u_xlatu18 & uint(_LightFlags)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlati27==4);
#else
    u_xlatb27 = u_xlati27==4;
#endif
    if(u_xlatb27){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat10_27 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlati0 = int(uint(u_xlatu18 & 1u));
    u_xlat4 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_27) + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat9 = float(1.0) / float(u_xlat4.w);
    u_xlat5.xyz = vec3(u_xlat9) * u_xlat4.xyz;
    u_xlat16_6.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat10_3.xyz * u_xlat16_6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb18 = unity_OrthoParams.w==0.0;
#endif
    u_xlat3.xyz = (-u_xlat4.xyz) * vec3(u_xlat9) + _WorldSpaceCameraPos.xyz;
    u_xlat7.x = (u_xlatb18) ? u_xlat3.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = (u_xlatb18) ? u_xlat3.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = (u_xlatb18) ? u_xlat3.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat18 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_33 = inversesqrt(u_xlat18);
    if(u_xlati0 != 0) {
        u_xlat16_8.x = 1.0;
    } else {
        u_xlat0.xzw = u_xlat5.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
        u_xlat0.xzw = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat5.xxx + u_xlat0.xzw;
        u_xlat0.xzw = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat5.zzz + u_xlat0.xzw;
        u_xlat0.xzw = u_xlat0.xzw + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
        vec3 txVec0 = vec3(u_xlat0.xz,u_xlat0.w);
        u_xlat16_0 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
        u_xlat16_17 = (-_MainLightShadowParams.x) + 1.0;
        u_xlat16_17 = u_xlat16_0 * _MainLightShadowParams.x + u_xlat16_17;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(0.0>=u_xlat0.w);
#else
        u_xlatb0 = 0.0>=u_xlat0.w;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb18 = !!(u_xlat0.w>=1.0);
#else
        u_xlatb18 = u_xlat0.w>=1.0;
#endif
        u_xlatb0 = u_xlatb18 || u_xlatb0;
        u_xlat16_17 = (u_xlatb0) ? 1.0 : u_xlat16_17;
        u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat9) + (-_WorldSpaceCameraPos.xyz);
        u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat16_26 = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = (-u_xlat16_17) + 1.0;
        u_xlat0.x = u_xlat16_26 * u_xlat0.x;
        u_xlat8 = u_xlat0.x * u_xlat16_26 + u_xlat16_17;
        u_xlat16_8.x = u_xlat8;
    }
    u_xlat0.x = u_xlat10_3.w * 0.5 + 0.5;
    u_xlat16_17 = (-u_xlat0.x) + 1.0;
    u_xlat16_17 = u_xlat16_17 * u_xlat16_17;
    u_xlat16_17 = max(u_xlat16_17, 0.0078125);
    u_xlat16_26 = u_xlat16_17 * u_xlat16_17;
    u_xlat0.x = u_xlat16_17 * 4.0 + 2.0;
    u_xlat9 = u_xlat16_17 * u_xlat16_17 + -1.0;
    u_xlat16_17 = dot(u_xlat16_6.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17 = min(max(u_xlat16_17, 0.0), 1.0);
#else
    u_xlat16_17 = clamp(u_xlat16_17, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_17 * u_xlat16_8.x;
    u_xlat16_8.xyw = u_xlat16_8.xxx * _LightColor.xyz;
    u_xlat3.xyz = u_xlat7.xyz * vec3(u_xlat16_33) + _LightDirection.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_33 = inversesqrt(u_xlat18);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_33);
    u_xlat18 = dot(u_xlat16_6.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat27 = dot(_LightDirection.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat9 = u_xlat18 * u_xlat9 + 1.00001001;
    u_xlat16_6.x = u_xlat27 * u_xlat27;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat18 = max(u_xlat16_6.x, 0.100000001);
    u_xlat9 = u_xlat18 * u_xlat9;
    u_xlat0.x = u_xlat0.x * u_xlat9;
    u_xlat0.x = u_xlat16_26 / u_xlat0.x;
    u_xlat16_6.x = u_xlat0.x + -6.10351562e-05;
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = min(u_xlat16_6.x, 100.0);
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat16_6.xxx + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_8.xyw * u_xlat16_6.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DIRECTIONAL" "_LIT" "_MAIN_LIGHT_SHADOWS" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	mediump vec4 _MainLightShadowParams;
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
UNITY_LOCATION(0) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(5) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
int u_xlati0;
uint u_xlatu0;
bool u_xlatb0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
mediump vec4 u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_17;
float u_xlat18;
mediump float u_xlat10_18;
bool u_xlatb18;
mediump float u_xlat16_26;
float u_xlat27;
mediump float u_xlat16_33;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_18 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat0.x = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlati0 = int(uint(u_xlatu0 & 1u));
    u_xlat4 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_18) + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat9 = float(1.0) / float(u_xlat4.w);
    u_xlat5.xyz = vec3(u_xlat9) * u_xlat4.xyz;
    u_xlat16_6.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat10_3.xyz * u_xlat16_6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb18 = unity_OrthoParams.w==0.0;
#endif
    u_xlat3.xyz = (-u_xlat4.xyz) * vec3(u_xlat9) + _WorldSpaceCameraPos.xyz;
    u_xlat7.x = (u_xlatb18) ? u_xlat3.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = (u_xlatb18) ? u_xlat3.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = (u_xlatb18) ? u_xlat3.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat18 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_33 = inversesqrt(u_xlat18);
    if(u_xlati0 != 0) {
        u_xlat16_8.x = 1.0;
    } else {
        u_xlat0.xzw = u_xlat5.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
        u_xlat0.xzw = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat5.xxx + u_xlat0.xzw;
        u_xlat0.xzw = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat5.zzz + u_xlat0.xzw;
        u_xlat0.xzw = u_xlat0.xzw + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
        vec3 txVec0 = vec3(u_xlat0.xz,u_xlat0.w);
        u_xlat16_0 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
        u_xlat16_17 = (-_MainLightShadowParams.x) + 1.0;
        u_xlat16_17 = u_xlat16_0 * _MainLightShadowParams.x + u_xlat16_17;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(0.0>=u_xlat0.w);
#else
        u_xlatb0 = 0.0>=u_xlat0.w;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb18 = !!(u_xlat0.w>=1.0);
#else
        u_xlatb18 = u_xlat0.w>=1.0;
#endif
        u_xlatb0 = u_xlatb18 || u_xlatb0;
        u_xlat16_17 = (u_xlatb0) ? 1.0 : u_xlat16_17;
        u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat9) + (-_WorldSpaceCameraPos.xyz);
        u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat16_26 = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = (-u_xlat16_17) + 1.0;
        u_xlat0.x = u_xlat16_26 * u_xlat0.x;
        u_xlat8 = u_xlat0.x * u_xlat16_26 + u_xlat16_17;
        u_xlat16_8.x = u_xlat8;
    }
    u_xlat0.x = u_xlat10_3.w * 0.5 + 0.5;
    u_xlat16_17 = (-u_xlat0.x) + 1.0;
    u_xlat16_17 = u_xlat16_17 * u_xlat16_17;
    u_xlat16_17 = max(u_xlat16_17, 0.0078125);
    u_xlat16_26 = u_xlat16_17 * u_xlat16_17;
    u_xlat0.x = u_xlat16_17 * 4.0 + 2.0;
    u_xlat9 = u_xlat16_17 * u_xlat16_17 + -1.0;
    u_xlat16_17 = dot(u_xlat16_6.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17 = min(max(u_xlat16_17, 0.0), 1.0);
#else
    u_xlat16_17 = clamp(u_xlat16_17, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_17 * u_xlat16_8.x;
    u_xlat16_8.xyw = u_xlat16_8.xxx * _LightColor.xyz;
    u_xlat3.xyz = u_xlat7.xyz * vec3(u_xlat16_33) + _LightDirection.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_33 = inversesqrt(u_xlat18);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_33);
    u_xlat18 = dot(u_xlat16_6.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat27 = dot(_LightDirection.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat9 = u_xlat18 * u_xlat9 + 1.00001001;
    u_xlat16_6.x = u_xlat27 * u_xlat27;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat18 = max(u_xlat16_6.x, 0.100000001);
    u_xlat9 = u_xlat18 * u_xlat9;
    u_xlat0.x = u_xlat0.x * u_xlat9;
    u_xlat0.x = u_xlat16_26 / u_xlat0.x;
    u_xlat16_6.x = u_xlat0.x + -6.10351562e-05;
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = min(u_xlat16_6.x, 100.0);
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat16_6.xxx + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_8.xyw * u_xlat16_6.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
}
 Pass {
  Name "Deferred Directional Light (SimpleLit)"
  Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  Blend One One, Zero One
  ZTest NotEqual
  ZWrite Off
  Cull Off
  Stencil {
   ReadMask 0
   WriteMask 0
   Comp Equal
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 287961
Program "vp" {
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DIRECTIONAL" "_SIMPLELIT" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec2 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat10_11;
float u_xlat15;
bool u_xlatb15;
mediump float u_xlat16_18;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat0;
    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_11 = textureLod(_CameraDepthTexture, u_xlat1.xy, 0.0).x;
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_11) + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat15 = float(1.0) / float(u_xlat0.w);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat15) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb15 = unity_OrthoParams.w==0.0;
#endif
    u_xlat2.x = (u_xlatb15) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb15) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb15) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat2.xyz * u_xlat16_3.xxx + _LightDirection.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat16_3.x = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.xxx;
    u_xlat10_2 = textureLod(_GBuffer2, u_xlat1.xy, 0.0);
    u_xlat16_3.x = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xxx;
    u_xlat15 = u_xlat10_2.w * 5.0 + 6.0;
    u_xlat15 = exp2(u_xlat15);
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = dot(u_xlat16_3.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xxx * _LightColor.xyz;
    u_xlat16_18 = log2(u_xlat0.x);
    u_xlat16_18 = u_xlat15 * u_xlat16_18;
    u_xlat16_18 = exp2(u_xlat16_18);
    u_xlat10_0.xyz = textureLod(_GBuffer1, u_xlat1.xy, 0.0).xyz;
    u_xlat10_1.xyz = textureLod(_GBuffer0, u_xlat1.xy, 0.0).xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_18) * u_xlat10_0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * u_xlat10_1.xyz + u_xlat16_4.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DEFERRED_SUBTRACTIVE_LIGHTING" "_DIRECTIONAL" "_SIMPLELIT" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
uniform 	int _LightFlags;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat14;
mediump float u_xlat10_14;
int u_xlati14;
uint u_xlatu14;
bool u_xlatb14;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
mediump float u_xlat16_26;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat14 = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu14 = uint(u_xlat14);
    u_xlati14 = int(uint(u_xlatu14 & uint(_LightFlags)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlati14==4);
#else
    u_xlatb14 = u_xlati14==4;
#endif
    if(u_xlatb14){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat10_14 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat4 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat4;
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_14) + u_xlat4;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat21 = float(1.0) / float(u_xlat0.w);
    u_xlat16_5.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat10_3.xyz * u_xlat16_5.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat21) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = (u_xlatb22) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat3.y = (u_xlatb22) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat3.z = (u_xlatb22) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_26 = inversesqrt(u_xlat0.x);
    u_xlat0.x = u_xlat10_3.w * 5.0 + 6.0;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_6.x = dot(u_xlat16_5.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xxx * _LightColor.xyz;
    u_xlat7.xyz = u_xlat3.xyz * vec3(u_xlat16_26) + _LightDirection.xyz;
    u_xlat22 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22 = max(u_xlat22, 1.17549435e-38);
    u_xlat16_26 = inversesqrt(u_xlat22);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat16_26);
    u_xlat7.x = dot(u_xlat16_5.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = log2(u_xlat7.x);
    u_xlat16_5.x = u_xlat0.x * u_xlat16_5.x;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat10_2.xyz * u_xlat16_5.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightColor.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * u_xlat10_1.xyz + u_xlat16_5.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DIRECTIONAL" "_GBUFFER_NORMALS_OCT" "_SIMPLELIT" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec2 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec4 u_xlat10_2;
uvec3 u_xlatu2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
ivec2 u_xlati4;
bvec2 u_xlatb4;
mediump vec3 u_xlat16_5;
vec2 u_xlat13;
mediump float u_xlat10_13;
uvec2 u_xlatu13;
float u_xlat18;
bool u_xlatb18;
float u_xlat20;
mediump float u_xlat16_21;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat0;
    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_13 = textureLod(_CameraDepthTexture, u_xlat1.xy, 0.0).x;
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_13) + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat18 = float(1.0) / float(u_xlat0.w);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat18) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb18 = unity_OrthoParams.w==0.0;
#endif
    u_xlat2.x = (u_xlatb18) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb18) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb18) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat2.xyz * u_xlat16_3.xxx + _LightDirection.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_3.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.xxx;
    u_xlat10_2 = textureLod(_GBuffer2, u_xlat1.xy, 0.0);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(255.5, 255.5, 255.5);
    u_xlat18 = u_xlat10_2.w * 10.0 + 1.0;
    u_xlat18 = exp2(u_xlat18);
    u_xlatu2.xyz = uvec3(u_xlat2.xyz);
    u_xlatu13.x = uint(u_xlatu2.z >> 4u);
    u_xlati4.y = int(int(u_xlatu13.x) << 8);
    u_xlati4.x = int(int_bitfieldInsert(0,int(u_xlatu2.z),8,4) );
    u_xlatu13.xy = uvec2(u_xlatu2.x | uint(u_xlati4.x), u_xlatu2.y | uint(u_xlati4.y));
    u_xlat13.xy = vec2(u_xlatu13.xy);
    u_xlat13.xy = u_xlat13.xy * vec2(0.000488400517, 0.000488400517) + vec2(-1.0, -1.0);
    u_xlat2.x = -abs(u_xlat13.x) + 1.0;
    u_xlat2.z = -abs(u_xlat13.y) + u_xlat2.x;
    u_xlat20 = max((-u_xlat2.z), 0.0);
    u_xlatb4.xy = greaterThanEqual(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat4.x = (u_xlatb4.x) ? (-float(u_xlat20)) : float(u_xlat20);
    u_xlat4.y = (u_xlatb4.y) ? (-float(u_xlat20)) : float(u_xlat20);
    u_xlat2.xy = u_xlat13.xy + u_xlat4.xy;
    u_xlat13.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13.x = inversesqrt(u_xlat13.x);
    u_xlat2.xyz = u_xlat13.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = dot(u_xlat2.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xxx * _LightColor.xyz;
    u_xlat16_21 = log2(u_xlat0.x);
    u_xlat16_21 = u_xlat18 * u_xlat16_21;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat10_0.xyz = textureLod(_GBuffer1, u_xlat1.xy, 0.0).xyz;
    u_xlat10_1.xyz = textureLod(_GBuffer0, u_xlat1.xy, 0.0).xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat10_0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightColor.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * u_xlat10_1.xyz + u_xlat16_5.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DEFERRED_SUBTRACTIVE_LIGHTING" "_DIRECTIONAL" "_GBUFFER_NORMALS_OCT" "_SIMPLELIT" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
uniform 	int _LightFlags;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(2) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
uvec3 u_xlatu3;
vec4 u_xlat4;
ivec2 u_xlati4;
vec2 u_xlat5;
bvec2 u_xlatb5;
mediump float u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_14;
float u_xlat16;
mediump float u_xlat10_16;
int u_xlati16;
uint u_xlatu16;
bool u_xlatb16;
float u_xlat24;
float u_xlat25;
uint u_xlatu25;
bool u_xlatb25;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat16 = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu16 = uint(u_xlat16);
    u_xlati16 = int(uint(u_xlatu16 & uint(_LightFlags)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlati16==4);
#else
    u_xlatb16 = u_xlati16==4;
#endif
    if(u_xlatb16){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat10_16 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat4 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat4;
    u_xlat0 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_16) + u_xlat4;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat24 = float(1.0) / float(u_xlat0.w);
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(255.5, 255.5, 255.5);
    u_xlatu3.xyz = uvec3(u_xlat3.xyz);
    u_xlatu25 = uint(u_xlatu3.z >> 4u);
    u_xlati4.x = int(int_bitfieldInsert(0,int(u_xlatu3.z),8,4) );
    u_xlati4.y = int(int(u_xlatu25) << 8);
    u_xlatu3.xy = uvec2(u_xlatu3.x | uint(u_xlati4.x), u_xlatu3.y | uint(u_xlati4.y));
    u_xlat3.xy = vec2(u_xlatu3.xy);
    u_xlat3.xy = u_xlat3.xy * vec2(0.000488400517, 0.000488400517) + vec2(-1.0, -1.0);
    u_xlat25 = -abs(u_xlat3.x) + 1.0;
    u_xlat4.z = -abs(u_xlat3.y) + u_xlat25;
    u_xlat25 = max((-u_xlat4.z), 0.0);
    u_xlatb5.xy = greaterThanEqual(u_xlat3.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat5.x = (u_xlatb5.x) ? (-float(u_xlat25)) : float(u_xlat25);
    u_xlat5.y = (u_xlatb5.y) ? (-float(u_xlat25)) : float(u_xlat25);
    u_xlat4.xy = u_xlat3.xy + u_xlat5.xy;
    u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb25 = unity_OrthoParams.w==0.0;
#endif
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat24) + _WorldSpaceCameraPos.xyz;
    u_xlat4.x = (u_xlatb25) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = (u_xlatb25) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = (u_xlatb25) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_6 = inversesqrt(u_xlat0.x);
    u_xlat0.x = u_xlat10_3.w * 10.0 + 1.0;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_14.x = dot(u_xlat3.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.x = min(max(u_xlat16_14.x, 0.0), 1.0);
#else
    u_xlat16_14.x = clamp(u_xlat16_14.x, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xxx * _LightColor.xyz;
    u_xlat8.xyz = u_xlat4.xyz * vec3(u_xlat16_6) + _LightDirection.xyz;
    u_xlat25 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat25 = max(u_xlat25, 1.17549435e-38);
    u_xlat16_6 = inversesqrt(u_xlat25);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_6);
    u_xlat8.x = dot(u_xlat3.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_6 = log2(u_xlat8.x);
    u_xlat16_6 = u_xlat0.x * u_xlat16_6;
    u_xlat16_6 = exp2(u_xlat16_6);
    u_xlat16_7.xyz = u_xlat10_2.xyz * vec3(u_xlat16_6);
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColor.xyz;
    SV_Target0.xyz = u_xlat16_14.xyz * u_xlat10_1.xyz + u_xlat16_7.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DEFERRED_SUBTRACTIVE_LIGHTING" "_DIRECTIONAL" "_GBUFFER_NORMALS_OCT" "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" "_SIMPLELIT" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
uniform 	int _LightFlags;
UNITY_LOCATION(0) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(5) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
int u_xlati0;
uint u_xlatu0;
bool u_xlatb0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
uvec3 u_xlatu3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
ivec2 u_xlati6;
bvec4 u_xlatb6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
vec4 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
float u_xlat22;
mediump vec3 u_xlat16_22;
vec2 u_xlat28;
uvec2 u_xlatu28;
bool u_xlatb28;
mediump float u_xlat16_36;
mediump float u_xlat10_42;
int u_xlati42;
bool u_xlatb42;
float u_xlat43;
mediump float u_xlat16_50;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat28.x = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu28.x = uint(u_xlat28.x);
    u_xlati42 = int(uint(u_xlatu28.x & uint(_LightFlags)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(u_xlati42==4);
#else
    u_xlatb42 = u_xlati42==4;
#endif
    if(u_xlatb42){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat10_42 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlati0 = int(uint(u_xlatu28.x & 1u));
    u_xlat4 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_42) + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat14.x = float(1.0) / float(u_xlat4.w);
    u_xlat5.xyz = u_xlat14.xxx * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(255.5, 255.5, 255.5);
    u_xlatu3.xyz = uvec3(u_xlat3.xyz);
    u_xlatu28.x = uint(u_xlatu3.z >> 4u);
    u_xlati6.x = int(int_bitfieldInsert(0,int(u_xlatu3.z),8,4) );
    u_xlati6.y = int(int(u_xlatu28.x) << 8);
    u_xlatu28.xy = uvec2(u_xlatu3.x | uint(u_xlati6.x), u_xlatu3.y | uint(u_xlati6.y));
    u_xlat28.xy = vec2(u_xlatu28.xy);
    u_xlat28.xy = u_xlat28.xy * vec2(0.000488400517, 0.000488400517) + vec2(-1.0, -1.0);
    u_xlat43 = -abs(u_xlat28.x) + 1.0;
    u_xlat3.z = -abs(u_xlat28.y) + u_xlat43;
    u_xlat43 = max((-u_xlat3.z), 0.0);
    u_xlatb6.xy = greaterThanEqual(u_xlat28.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat6.x = (u_xlatb6.x) ? (-float(u_xlat43)) : float(u_xlat43);
    u_xlat6.y = (u_xlatb6.y) ? (-float(u_xlat43)) : float(u_xlat43);
    u_xlat3.xy = u_xlat28.xy + u_xlat6.xy;
    u_xlat28.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat3.xyz = u_xlat28.xxx * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb28 = unity_OrthoParams.w==0.0;
#endif
    u_xlat6.xyz = (-u_xlat4.xyz) * u_xlat14.xxx + _WorldSpaceCameraPos.xyz;
    u_xlat7.x = (u_xlatb28) ? u_xlat6.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = (u_xlatb28) ? u_xlat6.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = (u_xlatb28) ? u_xlat6.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat28.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat28.x = max(u_xlat28.x, 1.17549435e-38);
    u_xlat16_8.x = inversesqrt(u_xlat28.x);
    if(u_xlati0 != 0) {
        u_xlat16_22.x = 1.0;
    } else {
        u_xlat0.xzw = u_xlat4.xyz * u_xlat14.xxx + (-_CascadeShadowSplitSpheres0.xyz);
        u_xlat6.xyz = u_xlat4.xyz * u_xlat14.xxx + (-_CascadeShadowSplitSpheres1.xyz);
        u_xlat9.xyz = u_xlat4.xyz * u_xlat14.xxx + (-_CascadeShadowSplitSpheres2.xyz);
        u_xlat10.xyz = u_xlat4.xyz * u_xlat14.xxx + (-_CascadeShadowSplitSpheres3.xyz);
        u_xlat11.x = dot(u_xlat0.xzw, u_xlat0.xzw);
        u_xlat11.y = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat11.z = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlat11.w = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb6 = lessThan(u_xlat11, _CascadeShadowSplitSphereRadii);
        u_xlat16_9.x = (u_xlatb6.x) ? float(1.0) : float(0.0);
        u_xlat16_9.y = (u_xlatb6.y) ? float(1.0) : float(0.0);
        u_xlat16_9.z = (u_xlatb6.z) ? float(1.0) : float(0.0);
        u_xlat16_9.w = (u_xlatb6.w) ? float(1.0) : float(0.0);
        u_xlat16_12.x = (u_xlatb6.x) ? float(-1.0) : float(-0.0);
        u_xlat16_12.y = (u_xlatb6.y) ? float(-1.0) : float(-0.0);
        u_xlat16_12.z = (u_xlatb6.z) ? float(-1.0) : float(-0.0);
        u_xlat16_12.xyz = u_xlat16_9.yzw + u_xlat16_12.xyz;
        u_xlat16_9.yzw = max(u_xlat16_12.xyz, vec3(0.0, 0.0, 0.0));
        u_xlat16_36 = dot(u_xlat16_9, vec4(4.0, 3.0, 2.0, 1.0));
        u_xlat16_36 = (-u_xlat16_36) + 4.0;
        u_xlatu0 = uint(u_xlat16_36);
        u_xlati0 = int(int(u_xlatu0) << 2);
        u_xlat6.xyz = u_xlat5.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 1)].xyz;
        u_xlat5.xyw = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati0].xyz * u_xlat5.xxx + u_xlat6.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 2)].xyz * u_xlat5.zzz + u_xlat5.xyw;
        u_xlat0.xzw = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 3)].xyz;
        vec3 txVec0 = vec3(u_xlat0.xz,u_xlat0.w);
        u_xlat16_0 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
        u_xlat16_36 = (-_MainLightShadowParams.x) + 1.0;
        u_xlat16_36 = u_xlat16_0 * _MainLightShadowParams.x + u_xlat16_36;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(0.0>=u_xlat0.w);
#else
        u_xlatb0 = 0.0>=u_xlat0.w;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb28 = !!(u_xlat0.w>=1.0);
#else
        u_xlatb28 = u_xlat0.w>=1.0;
#endif
        u_xlatb0 = u_xlatb28 || u_xlatb0;
        u_xlat16_36 = (u_xlatb0) ? 1.0 : u_xlat16_36;
        u_xlat0.xyz = u_xlat4.xyz * u_xlat14.xxx + (-_WorldSpaceCameraPos.xyz);
        u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat16_50 = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = (-u_xlat16_36) + 1.0;
        u_xlat0.x = u_xlat16_50 * u_xlat0.x;
        u_xlat22 = u_xlat0.x * u_xlat16_50 + u_xlat16_36;
        u_xlat16_22.x = u_xlat22;
    }
    u_xlat0.x = u_xlat10_3.w * 10.0 + 1.0;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_22.xyz = u_xlat16_22.xxx * _LightColor.xyz;
    u_xlat16_12.x = dot(u_xlat3.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_22.xyz * u_xlat16_12.xxx;
    u_xlat14.xyz = u_xlat7.xyz * u_xlat16_8.xxx + _LightDirection.xyz;
    u_xlat43 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat43 = max(u_xlat43, 1.17549435e-38);
    u_xlat16_8.x = inversesqrt(u_xlat43);
    u_xlat14.xyz = u_xlat14.xyz * u_xlat16_8.xxx;
    u_xlat14.x = dot(u_xlat3.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = log2(u_xlat14.x);
    u_xlat16_8.x = u_xlat0.x * u_xlat16_8.x;
    u_xlat16_8.x = exp2(u_xlat16_8.x);
    u_xlat16_13.xyz = u_xlat10_2.xyz * u_xlat16_8.xxx;
    u_xlat16_8.xyz = u_xlat16_22.xyz * u_xlat16_13.xyz;
    SV_Target0.xyz = u_xlat16_12.xyz * u_xlat10_1.xyz + u_xlat16_8.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DIRECTIONAL" "_GBUFFER_NORMALS_OCT" "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" "_SIMPLELIT" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
UNITY_LOCATION(0) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(5) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
int u_xlati0;
uint u_xlatu0;
bool u_xlatb0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
uvec3 u_xlatu3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
ivec2 u_xlati6;
bvec4 u_xlatb6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
vec4 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
float u_xlat22;
mediump vec3 u_xlat16_22;
vec2 u_xlat28;
mediump float u_xlat10_28;
uvec2 u_xlatu28;
bool u_xlatb28;
mediump float u_xlat16_36;
float u_xlat43;
mediump float u_xlat16_50;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_28 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat0.x = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlati0 = int(uint(u_xlatu0 & 1u));
    u_xlat4 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_28) + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat14.x = float(1.0) / float(u_xlat4.w);
    u_xlat5.xyz = u_xlat14.xxx * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(255.5, 255.5, 255.5);
    u_xlatu3.xyz = uvec3(u_xlat3.xyz);
    u_xlatu28.x = uint(u_xlatu3.z >> 4u);
    u_xlati6.x = int(int_bitfieldInsert(0,int(u_xlatu3.z),8,4) );
    u_xlati6.y = int(int(u_xlatu28.x) << 8);
    u_xlatu28.xy = uvec2(u_xlatu3.x | uint(u_xlati6.x), u_xlatu3.y | uint(u_xlati6.y));
    u_xlat28.xy = vec2(u_xlatu28.xy);
    u_xlat28.xy = u_xlat28.xy * vec2(0.000488400517, 0.000488400517) + vec2(-1.0, -1.0);
    u_xlat43 = -abs(u_xlat28.x) + 1.0;
    u_xlat3.z = -abs(u_xlat28.y) + u_xlat43;
    u_xlat43 = max((-u_xlat3.z), 0.0);
    u_xlatb6.xy = greaterThanEqual(u_xlat28.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat6.x = (u_xlatb6.x) ? (-float(u_xlat43)) : float(u_xlat43);
    u_xlat6.y = (u_xlatb6.y) ? (-float(u_xlat43)) : float(u_xlat43);
    u_xlat3.xy = u_xlat28.xy + u_xlat6.xy;
    u_xlat28.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat3.xyz = u_xlat28.xxx * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb28 = unity_OrthoParams.w==0.0;
#endif
    u_xlat6.xyz = (-u_xlat4.xyz) * u_xlat14.xxx + _WorldSpaceCameraPos.xyz;
    u_xlat7.x = (u_xlatb28) ? u_xlat6.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = (u_xlatb28) ? u_xlat6.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = (u_xlatb28) ? u_xlat6.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat28.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat28.x = max(u_xlat28.x, 1.17549435e-38);
    u_xlat16_8.x = inversesqrt(u_xlat28.x);
    if(u_xlati0 != 0) {
        u_xlat16_22.x = 1.0;
    } else {
        u_xlat0.xzw = u_xlat4.xyz * u_xlat14.xxx + (-_CascadeShadowSplitSpheres0.xyz);
        u_xlat6.xyz = u_xlat4.xyz * u_xlat14.xxx + (-_CascadeShadowSplitSpheres1.xyz);
        u_xlat9.xyz = u_xlat4.xyz * u_xlat14.xxx + (-_CascadeShadowSplitSpheres2.xyz);
        u_xlat10.xyz = u_xlat4.xyz * u_xlat14.xxx + (-_CascadeShadowSplitSpheres3.xyz);
        u_xlat11.x = dot(u_xlat0.xzw, u_xlat0.xzw);
        u_xlat11.y = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat11.z = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlat11.w = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb6 = lessThan(u_xlat11, _CascadeShadowSplitSphereRadii);
        u_xlat16_9.x = (u_xlatb6.x) ? float(1.0) : float(0.0);
        u_xlat16_9.y = (u_xlatb6.y) ? float(1.0) : float(0.0);
        u_xlat16_9.z = (u_xlatb6.z) ? float(1.0) : float(0.0);
        u_xlat16_9.w = (u_xlatb6.w) ? float(1.0) : float(0.0);
        u_xlat16_12.x = (u_xlatb6.x) ? float(-1.0) : float(-0.0);
        u_xlat16_12.y = (u_xlatb6.y) ? float(-1.0) : float(-0.0);
        u_xlat16_12.z = (u_xlatb6.z) ? float(-1.0) : float(-0.0);
        u_xlat16_12.xyz = u_xlat16_9.yzw + u_xlat16_12.xyz;
        u_xlat16_9.yzw = max(u_xlat16_12.xyz, vec3(0.0, 0.0, 0.0));
        u_xlat16_36 = dot(u_xlat16_9, vec4(4.0, 3.0, 2.0, 1.0));
        u_xlat16_36 = (-u_xlat16_36) + 4.0;
        u_xlatu0 = uint(u_xlat16_36);
        u_xlati0 = int(int(u_xlatu0) << 2);
        u_xlat6.xyz = u_xlat5.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 1)].xyz;
        u_xlat5.xyw = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati0].xyz * u_xlat5.xxx + u_xlat6.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 2)].xyz * u_xlat5.zzz + u_xlat5.xyw;
        u_xlat0.xzw = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 3)].xyz;
        vec3 txVec0 = vec3(u_xlat0.xz,u_xlat0.w);
        u_xlat16_0 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
        u_xlat16_36 = (-_MainLightShadowParams.x) + 1.0;
        u_xlat16_36 = u_xlat16_0 * _MainLightShadowParams.x + u_xlat16_36;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(0.0>=u_xlat0.w);
#else
        u_xlatb0 = 0.0>=u_xlat0.w;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb28 = !!(u_xlat0.w>=1.0);
#else
        u_xlatb28 = u_xlat0.w>=1.0;
#endif
        u_xlatb0 = u_xlatb28 || u_xlatb0;
        u_xlat16_36 = (u_xlatb0) ? 1.0 : u_xlat16_36;
        u_xlat0.xyz = u_xlat4.xyz * u_xlat14.xxx + (-_WorldSpaceCameraPos.xyz);
        u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat16_50 = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = (-u_xlat16_36) + 1.0;
        u_xlat0.x = u_xlat16_50 * u_xlat0.x;
        u_xlat22 = u_xlat0.x * u_xlat16_50 + u_xlat16_36;
        u_xlat16_22.x = u_xlat22;
    }
    u_xlat0.x = u_xlat10_3.w * 10.0 + 1.0;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_22.xyz = u_xlat16_22.xxx * _LightColor.xyz;
    u_xlat16_12.x = dot(u_xlat3.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_22.xyz * u_xlat16_12.xxx;
    u_xlat14.xyz = u_xlat7.xyz * u_xlat16_8.xxx + _LightDirection.xyz;
    u_xlat43 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat43 = max(u_xlat43, 1.17549435e-38);
    u_xlat16_8.x = inversesqrt(u_xlat43);
    u_xlat14.xyz = u_xlat14.xyz * u_xlat16_8.xxx;
    u_xlat14.x = dot(u_xlat3.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = log2(u_xlat14.x);
    u_xlat16_8.x = u_xlat0.x * u_xlat16_8.x;
    u_xlat16_8.x = exp2(u_xlat16_8.x);
    u_xlat16_13.xyz = u_xlat10_2.xyz * u_xlat16_8.xxx;
    u_xlat16_8.xyz = u_xlat16_22.xyz * u_xlat16_13.xyz;
    SV_Target0.xyz = u_xlat16_12.xyz * u_xlat10_1.xyz + u_xlat16_8.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DEFERRED_SUBTRACTIVE_LIGHTING" "_DIRECTIONAL" "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" "_SIMPLELIT" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
uniform 	int _LightFlags;
UNITY_LOCATION(0) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(5) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
int u_xlati0;
uint u_xlatu0;
bool u_xlatb0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bvec4 u_xlatb9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_21;
float u_xlat26;
uint u_xlatu26;
bool u_xlatb26;
mediump float u_xlat16_34;
mediump float u_xlat10_39;
int u_xlati39;
bool u_xlatb39;
float u_xlat40;
mediump float u_xlat16_45;
mediump float u_xlat16_47;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat26 = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu26 = uint(u_xlat26);
    u_xlati39 = int(uint(u_xlatu26 & uint(_LightFlags)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(u_xlati39==4);
#else
    u_xlatb39 = u_xlati39==4;
#endif
    if(u_xlatb39){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat10_39 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlati0 = int(uint(u_xlatu26 & 1u));
    u_xlat4 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_39) + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat13.x = float(1.0) / float(u_xlat4.w);
    u_xlat5.xyz = u_xlat13.xxx * u_xlat4.xyz;
    u_xlat16_6.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat10_3.xyz * u_xlat16_6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb26 = unity_OrthoParams.w==0.0;
#endif
    u_xlat3.xyz = (-u_xlat4.xyz) * u_xlat13.xxx + _WorldSpaceCameraPos.xyz;
    u_xlat7.x = (u_xlatb26) ? u_xlat3.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = (u_xlatb26) ? u_xlat3.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = (u_xlatb26) ? u_xlat3.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat26 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat26 = max(u_xlat26, 1.17549435e-38);
    u_xlat16_45 = inversesqrt(u_xlat26);
    if(u_xlati0 != 0) {
        u_xlat16_8.x = 1.0;
    } else {
        u_xlat0.xzw = u_xlat4.xyz * u_xlat13.xxx + (-_CascadeShadowSplitSpheres0.xyz);
        u_xlat3.xyz = u_xlat4.xyz * u_xlat13.xxx + (-_CascadeShadowSplitSpheres1.xyz);
        u_xlat9.xyz = u_xlat4.xyz * u_xlat13.xxx + (-_CascadeShadowSplitSpheres2.xyz);
        u_xlat10.xyz = u_xlat4.xyz * u_xlat13.xxx + (-_CascadeShadowSplitSpheres3.xyz);
        u_xlat11.x = dot(u_xlat0.xzw, u_xlat0.xzw);
        u_xlat11.y = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat11.z = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlat11.w = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb9 = lessThan(u_xlat11, _CascadeShadowSplitSphereRadii);
        u_xlat16_10.x = (u_xlatb9.x) ? float(1.0) : float(0.0);
        u_xlat16_10.y = (u_xlatb9.y) ? float(1.0) : float(0.0);
        u_xlat16_10.z = (u_xlatb9.z) ? float(1.0) : float(0.0);
        u_xlat16_10.w = (u_xlatb9.w) ? float(1.0) : float(0.0);
        u_xlat16_21.x = (u_xlatb9.x) ? float(-1.0) : float(-0.0);
        u_xlat16_21.y = (u_xlatb9.y) ? float(-1.0) : float(-0.0);
        u_xlat16_21.z = (u_xlatb9.z) ? float(-1.0) : float(-0.0);
        u_xlat16_21.xyz = u_xlat16_21.xyz + u_xlat16_10.yzw;
        u_xlat16_10.yzw = max(u_xlat16_21.xyz, vec3(0.0, 0.0, 0.0));
        u_xlat16_21.x = dot(u_xlat16_10, vec4(4.0, 3.0, 2.0, 1.0));
        u_xlat16_21.x = (-u_xlat16_21.x) + 4.0;
        u_xlatu0 = uint(u_xlat16_21.x);
        u_xlati0 = int(int(u_xlatu0) << 2);
        u_xlat3.xyz = u_xlat5.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 1)].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati0].xyz * u_xlat5.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 2)].xyz * u_xlat5.zzz + u_xlat3.xyz;
        u_xlat0.xzw = u_xlat3.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 3)].xyz;
        vec3 txVec0 = vec3(u_xlat0.xz,u_xlat0.w);
        u_xlat16_0 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
        u_xlat16_21.x = (-_MainLightShadowParams.x) + 1.0;
        u_xlat16_21.x = u_xlat16_0 * _MainLightShadowParams.x + u_xlat16_21.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(0.0>=u_xlat0.w);
#else
        u_xlatb0 = 0.0>=u_xlat0.w;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(u_xlat0.w>=1.0);
#else
        u_xlatb26 = u_xlat0.w>=1.0;
#endif
        u_xlatb0 = u_xlatb26 || u_xlatb0;
        u_xlat16_21.x = (u_xlatb0) ? 1.0 : u_xlat16_21.x;
        u_xlat0.xyz = u_xlat4.xyz * u_xlat13.xxx + (-_WorldSpaceCameraPos.xyz);
        u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat16_34 = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = (-u_xlat16_21.x) + 1.0;
        u_xlat0.x = u_xlat16_34 * u_xlat0.x;
        u_xlat8 = u_xlat0.x * u_xlat16_34 + u_xlat16_21.x;
        u_xlat16_8.x = u_xlat8;
    }
    u_xlat0.x = u_xlat10_3.w * 5.0 + 6.0;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_8.xyz = u_xlat16_8.xxx * _LightColor.xyz;
    u_xlat16_47 = dot(u_xlat16_6.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_47 = min(max(u_xlat16_47, 0.0), 1.0);
#else
    u_xlat16_47 = clamp(u_xlat16_47, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = vec3(u_xlat16_47) * u_xlat16_8.xyz;
    u_xlat13.xyz = u_xlat7.xyz * vec3(u_xlat16_45) + _LightDirection.xyz;
    u_xlat40 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat40 = max(u_xlat40, 1.17549435e-38);
    u_xlat16_45 = inversesqrt(u_xlat40);
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat16_45);
    u_xlat13.x = dot(u_xlat16_6.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = log2(u_xlat13.x);
    u_xlat16_6.x = u_xlat0.x * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat16_6.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    SV_Target0.xyz = u_xlat16_12.xyz * u_xlat10_1.xyz + u_xlat16_6.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DIRECTIONAL" "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" "_SIMPLELIT" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
UNITY_LOCATION(0) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(5) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
int u_xlati0;
uint u_xlatu0;
bool u_xlatb0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bvec4 u_xlatb9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_21;
float u_xlat26;
mediump float u_xlat10_26;
bool u_xlatb26;
mediump float u_xlat16_34;
float u_xlat40;
mediump float u_xlat16_45;
mediump float u_xlat16_47;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_26 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat0.x = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlati0 = int(uint(u_xlatu0 & 1u));
    u_xlat4 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_26) + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat13.x = float(1.0) / float(u_xlat4.w);
    u_xlat5.xyz = u_xlat13.xxx * u_xlat4.xyz;
    u_xlat16_6.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat10_3.xyz * u_xlat16_6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb26 = unity_OrthoParams.w==0.0;
#endif
    u_xlat3.xyz = (-u_xlat4.xyz) * u_xlat13.xxx + _WorldSpaceCameraPos.xyz;
    u_xlat7.x = (u_xlatb26) ? u_xlat3.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = (u_xlatb26) ? u_xlat3.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = (u_xlatb26) ? u_xlat3.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat26 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat26 = max(u_xlat26, 1.17549435e-38);
    u_xlat16_45 = inversesqrt(u_xlat26);
    if(u_xlati0 != 0) {
        u_xlat16_8.x = 1.0;
    } else {
        u_xlat0.xzw = u_xlat4.xyz * u_xlat13.xxx + (-_CascadeShadowSplitSpheres0.xyz);
        u_xlat3.xyz = u_xlat4.xyz * u_xlat13.xxx + (-_CascadeShadowSplitSpheres1.xyz);
        u_xlat9.xyz = u_xlat4.xyz * u_xlat13.xxx + (-_CascadeShadowSplitSpheres2.xyz);
        u_xlat10.xyz = u_xlat4.xyz * u_xlat13.xxx + (-_CascadeShadowSplitSpheres3.xyz);
        u_xlat11.x = dot(u_xlat0.xzw, u_xlat0.xzw);
        u_xlat11.y = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat11.z = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlat11.w = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb9 = lessThan(u_xlat11, _CascadeShadowSplitSphereRadii);
        u_xlat16_10.x = (u_xlatb9.x) ? float(1.0) : float(0.0);
        u_xlat16_10.y = (u_xlatb9.y) ? float(1.0) : float(0.0);
        u_xlat16_10.z = (u_xlatb9.z) ? float(1.0) : float(0.0);
        u_xlat16_10.w = (u_xlatb9.w) ? float(1.0) : float(0.0);
        u_xlat16_21.x = (u_xlatb9.x) ? float(-1.0) : float(-0.0);
        u_xlat16_21.y = (u_xlatb9.y) ? float(-1.0) : float(-0.0);
        u_xlat16_21.z = (u_xlatb9.z) ? float(-1.0) : float(-0.0);
        u_xlat16_21.xyz = u_xlat16_21.xyz + u_xlat16_10.yzw;
        u_xlat16_10.yzw = max(u_xlat16_21.xyz, vec3(0.0, 0.0, 0.0));
        u_xlat16_21.x = dot(u_xlat16_10, vec4(4.0, 3.0, 2.0, 1.0));
        u_xlat16_21.x = (-u_xlat16_21.x) + 4.0;
        u_xlatu0 = uint(u_xlat16_21.x);
        u_xlati0 = int(int(u_xlatu0) << 2);
        u_xlat3.xyz = u_xlat5.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 1)].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati0].xyz * u_xlat5.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 2)].xyz * u_xlat5.zzz + u_xlat3.xyz;
        u_xlat0.xzw = u_xlat3.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati0 + 3)].xyz;
        vec3 txVec0 = vec3(u_xlat0.xz,u_xlat0.w);
        u_xlat16_0 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
        u_xlat16_21.x = (-_MainLightShadowParams.x) + 1.0;
        u_xlat16_21.x = u_xlat16_0 * _MainLightShadowParams.x + u_xlat16_21.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(0.0>=u_xlat0.w);
#else
        u_xlatb0 = 0.0>=u_xlat0.w;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(u_xlat0.w>=1.0);
#else
        u_xlatb26 = u_xlat0.w>=1.0;
#endif
        u_xlatb0 = u_xlatb26 || u_xlatb0;
        u_xlat16_21.x = (u_xlatb0) ? 1.0 : u_xlat16_21.x;
        u_xlat0.xyz = u_xlat4.xyz * u_xlat13.xxx + (-_WorldSpaceCameraPos.xyz);
        u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat16_34 = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = (-u_xlat16_21.x) + 1.0;
        u_xlat0.x = u_xlat16_34 * u_xlat0.x;
        u_xlat8 = u_xlat0.x * u_xlat16_34 + u_xlat16_21.x;
        u_xlat16_8.x = u_xlat8;
    }
    u_xlat0.x = u_xlat10_3.w * 5.0 + 6.0;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_8.xyz = u_xlat16_8.xxx * _LightColor.xyz;
    u_xlat16_47 = dot(u_xlat16_6.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_47 = min(max(u_xlat16_47, 0.0), 1.0);
#else
    u_xlat16_47 = clamp(u_xlat16_47, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = vec3(u_xlat16_47) * u_xlat16_8.xyz;
    u_xlat13.xyz = u_xlat7.xyz * vec3(u_xlat16_45) + _LightDirection.xyz;
    u_xlat40 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat40 = max(u_xlat40, 1.17549435e-38);
    u_xlat16_45 = inversesqrt(u_xlat40);
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat16_45);
    u_xlat13.x = dot(u_xlat16_6.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = log2(u_xlat13.x);
    u_xlat16_6.x = u_xlat0.x * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat16_6.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    SV_Target0.xyz = u_xlat16_12.xyz * u_xlat10_1.xyz + u_xlat16_6.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DEFERRED_SUBTRACTIVE_LIGHTING" "_DIRECTIONAL" "_GBUFFER_NORMALS_OCT" "_MAIN_LIGHT_SHADOWS" "_SIMPLELIT" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	mediump vec4 _MainLightShadowParams;
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
uniform 	int _LightFlags;
UNITY_LOCATION(0) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(5) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
uvec3 u_xlatu3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
ivec2 u_xlati6;
bvec2 u_xlatb6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
float u_xlat19;
mediump vec3 u_xlat16_19;
vec2 u_xlat22;
uvec2 u_xlatu22;
bool u_xlatb22;
mediump float u_xlat16_30;
mediump float u_xlat10_33;
int u_xlati33;
bool u_xlatb33;
float u_xlat34;
mediump float u_xlat16_41;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat22.x = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu22.x = uint(u_xlat22.x);
    u_xlati33 = int(uint(u_xlatu22.x & uint(_LightFlags)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(u_xlati33==4);
#else
    u_xlatb33 = u_xlati33==4;
#endif
    if(u_xlatb33){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat10_33 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlati0 = int(uint(u_xlatu22.x & 1u));
    u_xlat4 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_33) + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat11.x = float(1.0) / float(u_xlat4.w);
    u_xlat5.xyz = u_xlat11.xxx * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(255.5, 255.5, 255.5);
    u_xlatu3.xyz = uvec3(u_xlat3.xyz);
    u_xlatu22.x = uint(u_xlatu3.z >> 4u);
    u_xlati6.x = int(int_bitfieldInsert(0,int(u_xlatu3.z),8,4) );
    u_xlati6.y = int(int(u_xlatu22.x) << 8);
    u_xlatu22.xy = uvec2(u_xlatu3.x | uint(u_xlati6.x), u_xlatu3.y | uint(u_xlati6.y));
    u_xlat22.xy = vec2(u_xlatu22.xy);
    u_xlat22.xy = u_xlat22.xy * vec2(0.000488400517, 0.000488400517) + vec2(-1.0, -1.0);
    u_xlat34 = -abs(u_xlat22.x) + 1.0;
    u_xlat3.z = -abs(u_xlat22.y) + u_xlat34;
    u_xlat34 = max((-u_xlat3.z), 0.0);
    u_xlatb6.xy = greaterThanEqual(u_xlat22.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat6.x = (u_xlatb6.x) ? (-float(u_xlat34)) : float(u_xlat34);
    u_xlat6.y = (u_xlatb6.y) ? (-float(u_xlat34)) : float(u_xlat34);
    u_xlat3.xy = u_xlat22.xy + u_xlat6.xy;
    u_xlat22.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat3.xyz = u_xlat22.xxx * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    u_xlat6.xyz = (-u_xlat4.xyz) * u_xlat11.xxx + _WorldSpaceCameraPos.xyz;
    u_xlat7.x = (u_xlatb22) ? u_xlat6.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = (u_xlatb22) ? u_xlat6.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = (u_xlatb22) ? u_xlat6.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat22.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22.x = max(u_xlat22.x, 1.17549435e-38);
    u_xlat16_8.x = inversesqrt(u_xlat22.x);
    if(u_xlati0 != 0) {
        u_xlat16_19.x = 1.0;
    } else {
        u_xlat0.xzw = u_xlat5.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
        u_xlat0.xzw = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat5.xxx + u_xlat0.xzw;
        u_xlat0.xzw = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat5.zzz + u_xlat0.xzw;
        u_xlat0.xzw = u_xlat0.xzw + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
        vec3 txVec0 = vec3(u_xlat0.xz,u_xlat0.w);
        u_xlat16_0 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
        u_xlat16_30 = (-_MainLightShadowParams.x) + 1.0;
        u_xlat16_30 = u_xlat16_0 * _MainLightShadowParams.x + u_xlat16_30;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(0.0>=u_xlat0.w);
#else
        u_xlatb0 = 0.0>=u_xlat0.w;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb22 = !!(u_xlat0.w>=1.0);
#else
        u_xlatb22 = u_xlat0.w>=1.0;
#endif
        u_xlatb0 = u_xlatb22 || u_xlatb0;
        u_xlat16_30 = (u_xlatb0) ? 1.0 : u_xlat16_30;
        u_xlat0.xyz = u_xlat4.xyz * u_xlat11.xxx + (-_WorldSpaceCameraPos.xyz);
        u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat16_41 = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = (-u_xlat16_30) + 1.0;
        u_xlat0.x = u_xlat16_41 * u_xlat0.x;
        u_xlat19 = u_xlat0.x * u_xlat16_41 + u_xlat16_30;
        u_xlat16_19.x = u_xlat19;
    }
    u_xlat0.x = u_xlat10_3.w * 10.0 + 1.0;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_19.xyz = u_xlat16_19.xxx * _LightColor.xyz;
    u_xlat16_9.x = dot(u_xlat3.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_19.xyz * u_xlat16_9.xxx;
    u_xlat11.xyz = u_xlat7.xyz * u_xlat16_8.xxx + _LightDirection.xyz;
    u_xlat34 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat34 = max(u_xlat34, 1.17549435e-38);
    u_xlat16_8.x = inversesqrt(u_xlat34);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat16_8.xxx;
    u_xlat11.x = dot(u_xlat3.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = log2(u_xlat11.x);
    u_xlat16_8.x = u_xlat0.x * u_xlat16_8.x;
    u_xlat16_8.x = exp2(u_xlat16_8.x);
    u_xlat16_10.xyz = u_xlat10_2.xyz * u_xlat16_8.xxx;
    u_xlat16_8.xyz = u_xlat16_19.xyz * u_xlat16_10.xyz;
    SV_Target0.xyz = u_xlat16_9.xyz * u_xlat10_1.xyz + u_xlat16_8.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DIRECTIONAL" "_GBUFFER_NORMALS_OCT" "_MAIN_LIGHT_SHADOWS" "_SIMPLELIT" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	mediump vec4 _MainLightShadowParams;
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
UNITY_LOCATION(0) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(5) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
int u_xlati0;
uint u_xlatu0;
bool u_xlatb0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
uvec3 u_xlatu3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
ivec2 u_xlati6;
bvec2 u_xlatb6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
float u_xlat19;
mediump vec3 u_xlat16_19;
vec2 u_xlat22;
mediump float u_xlat10_22;
uvec2 u_xlatu22;
bool u_xlatb22;
mediump float u_xlat16_30;
float u_xlat34;
mediump float u_xlat16_41;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_22 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat0.x = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlati0 = int(uint(u_xlatu0 & 1u));
    u_xlat4 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_22) + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat11.x = float(1.0) / float(u_xlat4.w);
    u_xlat5.xyz = u_xlat11.xxx * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(255.5, 255.5, 255.5);
    u_xlatu3.xyz = uvec3(u_xlat3.xyz);
    u_xlatu22.x = uint(u_xlatu3.z >> 4u);
    u_xlati6.x = int(int_bitfieldInsert(0,int(u_xlatu3.z),8,4) );
    u_xlati6.y = int(int(u_xlatu22.x) << 8);
    u_xlatu22.xy = uvec2(u_xlatu3.x | uint(u_xlati6.x), u_xlatu3.y | uint(u_xlati6.y));
    u_xlat22.xy = vec2(u_xlatu22.xy);
    u_xlat22.xy = u_xlat22.xy * vec2(0.000488400517, 0.000488400517) + vec2(-1.0, -1.0);
    u_xlat34 = -abs(u_xlat22.x) + 1.0;
    u_xlat3.z = -abs(u_xlat22.y) + u_xlat34;
    u_xlat34 = max((-u_xlat3.z), 0.0);
    u_xlatb6.xy = greaterThanEqual(u_xlat22.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat6.x = (u_xlatb6.x) ? (-float(u_xlat34)) : float(u_xlat34);
    u_xlat6.y = (u_xlatb6.y) ? (-float(u_xlat34)) : float(u_xlat34);
    u_xlat3.xy = u_xlat22.xy + u_xlat6.xy;
    u_xlat22.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat3.xyz = u_xlat22.xxx * u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    u_xlat6.xyz = (-u_xlat4.xyz) * u_xlat11.xxx + _WorldSpaceCameraPos.xyz;
    u_xlat7.x = (u_xlatb22) ? u_xlat6.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = (u_xlatb22) ? u_xlat6.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = (u_xlatb22) ? u_xlat6.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat22.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22.x = max(u_xlat22.x, 1.17549435e-38);
    u_xlat16_8.x = inversesqrt(u_xlat22.x);
    if(u_xlati0 != 0) {
        u_xlat16_19.x = 1.0;
    } else {
        u_xlat0.xzw = u_xlat5.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
        u_xlat0.xzw = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat5.xxx + u_xlat0.xzw;
        u_xlat0.xzw = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat5.zzz + u_xlat0.xzw;
        u_xlat0.xzw = u_xlat0.xzw + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
        vec3 txVec0 = vec3(u_xlat0.xz,u_xlat0.w);
        u_xlat16_0 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
        u_xlat16_30 = (-_MainLightShadowParams.x) + 1.0;
        u_xlat16_30 = u_xlat16_0 * _MainLightShadowParams.x + u_xlat16_30;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(0.0>=u_xlat0.w);
#else
        u_xlatb0 = 0.0>=u_xlat0.w;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb22 = !!(u_xlat0.w>=1.0);
#else
        u_xlatb22 = u_xlat0.w>=1.0;
#endif
        u_xlatb0 = u_xlatb22 || u_xlatb0;
        u_xlat16_30 = (u_xlatb0) ? 1.0 : u_xlat16_30;
        u_xlat0.xyz = u_xlat4.xyz * u_xlat11.xxx + (-_WorldSpaceCameraPos.xyz);
        u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat16_41 = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = (-u_xlat16_30) + 1.0;
        u_xlat0.x = u_xlat16_41 * u_xlat0.x;
        u_xlat19 = u_xlat0.x * u_xlat16_41 + u_xlat16_30;
        u_xlat16_19.x = u_xlat19;
    }
    u_xlat0.x = u_xlat10_3.w * 10.0 + 1.0;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_19.xyz = u_xlat16_19.xxx * _LightColor.xyz;
    u_xlat16_9.x = dot(u_xlat3.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_19.xyz * u_xlat16_9.xxx;
    u_xlat11.xyz = u_xlat7.xyz * u_xlat16_8.xxx + _LightDirection.xyz;
    u_xlat34 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat34 = max(u_xlat34, 1.17549435e-38);
    u_xlat16_8.x = inversesqrt(u_xlat34);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat16_8.xxx;
    u_xlat11.x = dot(u_xlat3.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = log2(u_xlat11.x);
    u_xlat16_8.x = u_xlat0.x * u_xlat16_8.x;
    u_xlat16_8.x = exp2(u_xlat16_8.x);
    u_xlat16_10.xyz = u_xlat10_2.xyz * u_xlat16_8.xxx;
    u_xlat16_8.xyz = u_xlat16_19.xyz * u_xlat16_10.xyz;
    SV_Target0.xyz = u_xlat16_9.xyz * u_xlat10_1.xyz + u_xlat16_8.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DEFERRED_SUBTRACTIVE_LIGHTING" "_DIRECTIONAL" "_MAIN_LIGHT_SHADOWS" "_SIMPLELIT" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	mediump vec4 _MainLightShadowParams;
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
uniform 	int _LightFlags;
UNITY_LOCATION(0) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(5) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump float u_xlat16_18;
float u_xlat20;
uint u_xlatu20;
bool u_xlatb20;
mediump float u_xlat16_28;
mediump float u_xlat10_30;
int u_xlati30;
bool u_xlatb30;
float u_xlat31;
mediump float u_xlat16_36;
mediump float u_xlat16_38;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat20 = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu20 = uint(u_xlat20);
    u_xlati30 = int(uint(u_xlatu20 & uint(_LightFlags)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(u_xlati30==4);
#else
    u_xlatb30 = u_xlati30==4;
#endif
    if(u_xlatb30){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat10_30 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlati0 = int(uint(u_xlatu20 & 1u));
    u_xlat4 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_30) + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat10.x = float(1.0) / float(u_xlat4.w);
    u_xlat5.xyz = u_xlat10.xxx * u_xlat4.xyz;
    u_xlat16_6.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat10_3.xyz * u_xlat16_6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb20 = unity_OrthoParams.w==0.0;
#endif
    u_xlat3.xyz = (-u_xlat4.xyz) * u_xlat10.xxx + _WorldSpaceCameraPos.xyz;
    u_xlat7.x = (u_xlatb20) ? u_xlat3.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = (u_xlatb20) ? u_xlat3.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = (u_xlatb20) ? u_xlat3.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat20 = max(u_xlat20, 1.17549435e-38);
    u_xlat16_36 = inversesqrt(u_xlat20);
    if(u_xlati0 != 0) {
        u_xlat16_8.x = 1.0;
    } else {
        u_xlat0.xzw = u_xlat5.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
        u_xlat0.xzw = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat5.xxx + u_xlat0.xzw;
        u_xlat0.xzw = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat5.zzz + u_xlat0.xzw;
        u_xlat0.xzw = u_xlat0.xzw + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
        vec3 txVec0 = vec3(u_xlat0.xz,u_xlat0.w);
        u_xlat16_0 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
        u_xlat16_18 = (-_MainLightShadowParams.x) + 1.0;
        u_xlat16_18 = u_xlat16_0 * _MainLightShadowParams.x + u_xlat16_18;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(0.0>=u_xlat0.w);
#else
        u_xlatb0 = 0.0>=u_xlat0.w;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb20 = !!(u_xlat0.w>=1.0);
#else
        u_xlatb20 = u_xlat0.w>=1.0;
#endif
        u_xlatb0 = u_xlatb20 || u_xlatb0;
        u_xlat16_18 = (u_xlatb0) ? 1.0 : u_xlat16_18;
        u_xlat0.xyz = u_xlat4.xyz * u_xlat10.xxx + (-_WorldSpaceCameraPos.xyz);
        u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat16_28 = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = (-u_xlat16_18) + 1.0;
        u_xlat0.x = u_xlat16_28 * u_xlat0.x;
        u_xlat8 = u_xlat0.x * u_xlat16_28 + u_xlat16_18;
        u_xlat16_8.x = u_xlat8;
    }
    u_xlat0.x = u_xlat10_3.w * 5.0 + 6.0;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_8.xyz = u_xlat16_8.xxx * _LightColor.xyz;
    u_xlat16_38 = dot(u_xlat16_6.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_8.xyz;
    u_xlat10.xyz = u_xlat7.xyz * vec3(u_xlat16_36) + _LightDirection.xyz;
    u_xlat31 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat31 = max(u_xlat31, 1.17549435e-38);
    u_xlat16_36 = inversesqrt(u_xlat31);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_36);
    u_xlat10.x = dot(u_xlat16_6.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = log2(u_xlat10.x);
    u_xlat16_6.x = u_xlat0.x * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat16_6.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    SV_Target0.xyz = u_xlat16_9.xyz * u_xlat10_1.xyz + u_xlat16_6.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_DIRECTIONAL" "_MAIN_LIGHT_SHADOWS" "_SIMPLELIT" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	mediump vec4 _MainLightShadowParams;
uniform 	vec4 hlslcc_mtx4x4_ScreenToWorld[8];
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _LightDirection;
UNITY_LOCATION(0) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GBuffer0;
UNITY_LOCATION(4) uniform mediump sampler2D _GBuffer1;
UNITY_LOCATION(5) uniform mediump sampler2D _GBuffer2;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
int u_xlati0;
uint u_xlatu0;
bool u_xlatb0;
mediump vec4 u_xlat10_1;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump float u_xlat16_18;
float u_xlat20;
mediump float u_xlat10_20;
bool u_xlatb20;
mediump float u_xlat16_28;
float u_xlat31;
mediump float u_xlat16_36;
mediump float u_xlat16_38;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.zz;
    u_xlat10_20 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0).x;
    u_xlat10_1 = textureLod(_GBuffer0, u_xlat0.xy, 0.0);
    u_xlat10_2.xyz = textureLod(_GBuffer1, u_xlat0.xy, 0.0).xyz;
    u_xlat10_3 = textureLod(_GBuffer2, u_xlat0.xy, 0.0);
    u_xlat0.x = u_xlat10_1.w * 255.0 + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlati0 = int(uint(u_xlatu0 & 1u));
    u_xlat4 = hlslcc_FragCoord.yyyy * hlslcc_mtx4x4_ScreenToWorld[1];
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[0] * hlslcc_FragCoord.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4_ScreenToWorld[2] * vec4(u_xlat10_20) + u_xlat4;
    u_xlat4 = u_xlat4 + hlslcc_mtx4x4_ScreenToWorld[3];
    u_xlat10.x = float(1.0) / float(u_xlat4.w);
    u_xlat5.xyz = u_xlat10.xxx * u_xlat4.xyz;
    u_xlat16_6.x = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat10_3.xyz * u_xlat16_6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb20 = unity_OrthoParams.w==0.0;
#endif
    u_xlat3.xyz = (-u_xlat4.xyz) * u_xlat10.xxx + _WorldSpaceCameraPos.xyz;
    u_xlat7.x = (u_xlatb20) ? u_xlat3.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = (u_xlatb20) ? u_xlat3.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = (u_xlatb20) ? u_xlat3.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat20 = max(u_xlat20, 1.17549435e-38);
    u_xlat16_36 = inversesqrt(u_xlat20);
    if(u_xlati0 != 0) {
        u_xlat16_8.x = 1.0;
    } else {
        u_xlat0.xzw = u_xlat5.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
        u_xlat0.xzw = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat5.xxx + u_xlat0.xzw;
        u_xlat0.xzw = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat5.zzz + u_xlat0.xzw;
        u_xlat0.xzw = u_xlat0.xzw + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
        vec3 txVec0 = vec3(u_xlat0.xz,u_xlat0.w);
        u_xlat16_0 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
        u_xlat16_18 = (-_MainLightShadowParams.x) + 1.0;
        u_xlat16_18 = u_xlat16_0 * _MainLightShadowParams.x + u_xlat16_18;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(0.0>=u_xlat0.w);
#else
        u_xlatb0 = 0.0>=u_xlat0.w;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb20 = !!(u_xlat0.w>=1.0);
#else
        u_xlatb20 = u_xlat0.w>=1.0;
#endif
        u_xlatb0 = u_xlatb20 || u_xlatb0;
        u_xlat16_18 = (u_xlatb0) ? 1.0 : u_xlat16_18;
        u_xlat0.xyz = u_xlat4.xyz * u_xlat10.xxx + (-_WorldSpaceCameraPos.xyz);
        u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat16_28 = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = (-u_xlat16_18) + 1.0;
        u_xlat0.x = u_xlat16_28 * u_xlat0.x;
        u_xlat8 = u_xlat0.x * u_xlat16_28 + u_xlat16_18;
        u_xlat16_8.x = u_xlat8;
    }
    u_xlat0.x = u_xlat10_3.w * 5.0 + 6.0;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_8.xyz = u_xlat16_8.xxx * _LightColor.xyz;
    u_xlat16_38 = dot(u_xlat16_6.xyz, _LightDirection.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_8.xyz;
    u_xlat10.xyz = u_xlat7.xyz * vec3(u_xlat16_36) + _LightDirection.xyz;
    u_xlat31 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat31 = max(u_xlat31, 1.17549435e-38);
    u_xlat16_36 = inversesqrt(u_xlat31);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat16_36);
    u_xlat10.x = dot(u_xlat16_6.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = log2(u_xlat10.x);
    u_xlat16_6.x = u_xlat0.x * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat16_6.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    SV_Target0.xyz = u_xlat16_9.xyz * u_xlat10_1.xyz + u_xlat16_6.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
}
 Pass {
  Name "ClearStencilPartial"
  Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  ColorMask 0 0
  ZTest NotEqual
  ZWrite Off
  Cull Off
  Stencil {
   ReadMask 0
   WriteMask 0
   Comp NotEqual
   Pass Zero
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 416250
Program "vp" {
SubProgram "gles3 " {
Keywords { "_CLEAR_STENCIL_PARTIAL" }
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
out highp vec3 vs_TEXCOORD1;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD1.z = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(1.0, 1.0, 1.0, 1.0);
    return;
}

#endif
"
}
}
}
}
Fallback "Hidden/Universal Render Pipeline/FallbackError"
}