function [aeroForces] = paramSpace_1_1_1_1_3_1_3(sailStates,airStates)

	CL = (7.492126)*sailStates.alpha + (-0.742511)*sailStates.beta + (-3.452285)*sailStates.p + (49.609749)*sailStates.q + (-3.868689)*sailStates.r + (0.012350)*sailStates.de;
	CD = -3.120510;
	CY = (-0.262623)*sailStates.alpha + (-0.031086)*sailStates.beta + (-1.613527)*sailStates.p + (2.260752)*sailStates.q + (-0.284723)*sailStates.r + (0.000485)*sailStates.de;

	Cl = (3.232435)*sailStates.alpha + (0.477097)*sailStates.beta + (-1.934116)*sailStates.p + (19.025698)*sailStates.q + (-3.329211)*sailStates.r + (0.001493)*sailStates.de;
	Cm = (-12.167725)*sailStates.alpha + (2.832456)*sailStates.beta + (9.225913)*sailStates.p + (-156.476898)*sailStates.q + (12.872216)*sailStates.r + (-0.069804)*sailStates.de;
	Cn = (1.976699)*sailStates.alpha + (0.136661)*sailStates.beta + (3.274487)*sailStates.p + (-15.043692)*sailStates.q + (0.050497)*sailStates.r + (-0.000940)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end