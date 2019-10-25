function [aeroForces] = paramSpace_2_2_3_2_3_3_1(sailStates,airStates)

	CL = (4.272776)*sailStates.alpha + (0.052024)*sailStates.beta + (-2.130485)*sailStates.p + (30.536978)*sailStates.q + (0.531453)*sailStates.r + (0.010626)*sailStates.de;
	CD = -0.326690;
	CY = (0.031701)*sailStates.alpha + (-0.025191)*sailStates.beta + (0.300582)*sailStates.p + (0.668511)*sailStates.q + (0.019725)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.026802)*sailStates.alpha + (-0.165103)*sailStates.beta + (-0.882711)*sailStates.p + (6.633883)*sailStates.q + (0.605152)*sailStates.r + (-0.000156)*sailStates.de;
	Cm = (-14.799534)*sailStates.alpha + (-0.223232)*sailStates.beta + (7.551335)*sailStates.p + (-125.787453)*sailStates.q + (-1.819265)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (0.319907)*sailStates.alpha + (-0.011889)*sailStates.beta + (-0.737446)*sailStates.p + (2.950720)*sailStates.q + (-0.004960)*sailStates.r + (-0.000136)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end