//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Universal Render Pipeline/PaniniProjection" {
Properties {
}
SubShader {
 LOD 100
 Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
 Pass {
  Name "Panini Projection"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 39594
Program "vp" {
SubProgram "gles3 " {
Local Keywords { "_GENERIC" }
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
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat10_0;
float u_xlat1;
float u_xlat3;
float u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * _Params.xy;
    u_xlat0.xy = u_xlat0.xy * _Params.ww;
    u_xlat4 = _Params.z + 1.0;
    u_xlat6 = u_xlat4 * u_xlat4;
    u_xlat6 = u_xlat0.x * u_xlat0.x + u_xlat6;
    u_xlat1 = u_xlat0.x * _Params.z;
    u_xlat3 = (-u_xlat1) * u_xlat1 + u_xlat6;
    u_xlat3 = sqrt(u_xlat3);
    u_xlat3 = u_xlat4 * u_xlat3;
    u_xlat1 = (-u_xlat1) * u_xlat0.x + u_xlat3;
    u_xlat6 = u_xlat1 / u_xlat6;
    u_xlat1 = u_xlat6 + _Params.z;
    u_xlat4 = u_xlat1 / u_xlat4;
    u_xlat0.xy = vec2(u_xlat4) * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat6);
    u_xlat0.xy = u_xlat0.xy / _Params.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_0 = texture(_SourceTex, u_xlat0.xy);
    SV_Target0 = u_xlat10_0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_UNIT_DISTANCE" }
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
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat10_0;
float u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * _Params.xy;
    u_xlat0.xy = u_xlat0.xy * _Params.ww;
    u_xlat2 = u_xlat0.x * u_xlat0.x;
    u_xlat3 = u_xlat0.x * u_xlat0.x + 4.0;
    u_xlat3 = sqrt(u_xlat3);
    u_xlat2 = u_xlat2 / u_xlat3;
    u_xlat2 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat2 / u_xlat3;
    u_xlat0.xy = vec2(u_xlat2) * u_xlat0.xy;
    u_xlat2 = u_xlat2 * 2.0 + -1.0;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat2);
    u_xlat0.xy = u_xlat0.xy / _Params.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_0 = texture(_SourceTex, u_xlat0.xy);
    SV_Target0 = u_xlat10_0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_GENERIC" }
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
out highp vec2 vs_TEXCOORD0;
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
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
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
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat10_0;
float u_xlat1;
float u_xlat3;
float u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * _Params.xy;
    u_xlat0.xy = u_xlat0.xy * _Params.ww;
    u_xlat4 = _Params.z + 1.0;
    u_xlat6 = u_xlat4 * u_xlat4;
    u_xlat6 = u_xlat0.x * u_xlat0.x + u_xlat6;
    u_xlat1 = u_xlat0.x * _Params.z;
    u_xlat3 = (-u_xlat1) * u_xlat1 + u_xlat6;
    u_xlat3 = sqrt(u_xlat3);
    u_xlat3 = u_xlat4 * u_xlat3;
    u_xlat1 = (-u_xlat1) * u_xlat0.x + u_xlat3;
    u_xlat6 = u_xlat1 / u_xlat6;
    u_xlat1 = u_xlat6 + _Params.z;
    u_xlat4 = u_xlat1 / u_xlat4;
    u_xlat0.xy = vec2(u_xlat4) * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat6);
    u_xlat0.xy = u_xlat0.xy / _Params.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_0 = texture(_SourceTex, u_xlat0.xy);
    SV_Target0 = u_xlat10_0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_UNIT_DISTANCE" }
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
out highp vec2 vs_TEXCOORD0;
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
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
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
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat10_0;
float u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * _Params.xy;
    u_xlat0.xy = u_xlat0.xy * _Params.ww;
    u_xlat2 = u_xlat0.x * u_xlat0.x;
    u_xlat3 = u_xlat0.x * u_xlat0.x + 4.0;
    u_xlat3 = sqrt(u_xlat3);
    u_xlat2 = u_xlat2 / u_xlat3;
    u_xlat2 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat2 / u_xlat3;
    u_xlat0.xy = vec2(u_xlat2) * u_xlat0.xy;
    u_xlat2 = u_xlat2 * 2.0 + -1.0;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat2);
    u_xlat0.xy = u_xlat0.xy / _Params.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_0 = texture(_SourceTex, u_xlat0.xy);
    SV_Target0 = u_xlat10_0;
    return;
}

#endif
"
}
}
}
}
}