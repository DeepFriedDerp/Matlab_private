function [aeroForces] = paramSpace_4_3_2_1_3_2_2(sailStates,airStates)

	CL = (3.847619)*sailStates.alpha + (-0.045504)*sailStates.beta + (-2.529636)*sailStates.p + (34.983578)*sailStates.q + (0.555973)*sailStates.r + (0.010689)*sailStates.de;
	CD = 0.051100;
	CY = (0.202290)*sailStates.alpha + (-0.026689)*sailStates.beta + (-0.050076)*sailStates.p + (1.664521)*sailStates.q + (0.009901)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (1.143656)*sailStates.alpha + (-0.052753)*sailStates.beta + (-1.178060)*sailStates.p + (9.620485)*sailStates.q + (0.312672)*sailStates.r + (0.000402)*sailStates.de;
	Cm = (-14.047293)*sailStates.alpha + (0.160124)*sailStates.beta + (8.746442)*sailStates.p + (-137.222183)*sailStates.q + (-1.913133)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (-0.383973)*sailStates.alpha + (0.011531)*sailStates.beta + (0.257359)*sailStates.p + (-3.072527)*sailStates.q + (-0.066721)*sailStates.r + (-0.000483)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end