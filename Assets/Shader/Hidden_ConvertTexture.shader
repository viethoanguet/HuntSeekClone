//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/ConvertTexture" {
Properties {
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 35090
Program "vp" {
SubProgram "gles " {
"#ifdef VERTEX
#version 100

vec4 ImmCB_1[10];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _faceIndex;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
int u_xlati4;
#define UNITY_DYNAMIC_INDEX_ES2 0



vec4 ImmCB_1DynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return ImmCB_1[i];
#else
#define d_ar ImmCB_1
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
ImmCB_1[0] = vec4(0.0,0.0,-1.0,0.0);
ImmCB_1[1] = vec4(0.0,0.0,1.0,0.0);
ImmCB_1[2] = vec4(1.0,0.0,0.0,0.0);
ImmCB_1[3] = vec4(1.0,0.0,0.0,0.0);
ImmCB_1[4] = vec4(1.0,0.0,0.0,-1.0);
ImmCB_1[5] = vec4(-1.0,0.0,0.0,-1.0);
ImmCB_1[6] = vec4(0.0,0.0,1.0,0.0);
ImmCB_1[7] = vec4(0.0,0.0,-1.0,0.0);
ImmCB_1[8] = vec4(0.0,0.0,0.0,-1.0);
ImmCB_1[9] = vec4(0.0,0.0,0.0,-1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = 0.0;
    u_xlat1.z = 0.0;
    u_xlati4 = int(_faceIndex);
    u_xlat1.xy = ImmCB_1DynamicIndex(u_xlati4).zx * ImmCB_1DynamicIndex(u_xlati4 + 4).wz;
    u_xlat2.xz = ImmCB_1DynamicIndex(u_xlati4 + 4).zw;
    u_xlat2.y = ImmCB_1DynamicIndex(u_xlati4).z;
    u_xlat0.z = ImmCB_1DynamicIndex(u_xlati4).x;
    u_xlat0.xzw = (-u_xlat2.xyz) * u_xlat0.xxz + u_xlat1.xyz;
    u_xlat1.y = 0.0;
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xz = ImmCB_1DynamicIndex(u_xlati4).xz;
    u_xlat3.yz = ImmCB_1DynamicIndex(u_xlati4 + 4).wz;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat3.x = 0.0;
    vs_TEXCOORD0.xyz = u_xlat2.yyy * u_xlat3.xyz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform lowp samplerCube _MainTex;
varying highp vec3 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = textureCube(_MainTex, vs_TEXCOORD0.xyz);
    SV_Target0 = u_xlat10_0;
    return;
}

#endif
"
}
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
vec4 ImmCB_1[10];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _faceIndex;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
int u_xlati4;
void main()
{
ImmCB_1[0] = vec4(0.0,0.0,-1.0,0.0);
ImmCB_1[1] = vec4(0.0,0.0,1.0,0.0);
ImmCB_1[2] = vec4(1.0,0.0,0.0,0.0);
ImmCB_1[3] = vec4(1.0,0.0,0.0,0.0);
ImmCB_1[4] = vec4(1.0,0.0,0.0,-1.0);
ImmCB_1[5] = vec4(-1.0,0.0,0.0,-1.0);
ImmCB_1[6] = vec4(0.0,0.0,1.0,0.0);
ImmCB_1[7] = vec4(0.0,0.0,-1.0,0.0);
ImmCB_1[8] = vec4(0.0,0.0,0.0,-1.0);
ImmCB_1[9] = vec4(0.0,0.0,0.0,-1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = 0.0;
    u_xlat1.z = 0.0;
    u_xlati4 = int(_faceIndex);
    u_xlat1.xy = ImmCB_1[u_xlati4].zx * ImmCB_1[u_xlati4 + 4].wz;
    u_xlat2.xz = ImmCB_1[u_xlati4 + 4].zw;
    u_xlat2.y = ImmCB_1[u_xlati4].z;
    u_xlat0.z = ImmCB_1[u_xlati4].x;
    u_xlat0.xzw = (-u_xlat2.xyz) * u_xlat0.xxz + u_xlat1.xyz;
    u_xlat1.y = 0.0;
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xz = ImmCB_1[u_xlati4].xz;
    u_xlat3.yz = ImmCB_1[u_xlati4 + 4].wz;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat3.x = 0.0;
    vs_TEXCOORD0.xyz = u_xlat2.yyy * u_xlat3.xyz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _MainTex;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xyz);
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
}
}
}
}