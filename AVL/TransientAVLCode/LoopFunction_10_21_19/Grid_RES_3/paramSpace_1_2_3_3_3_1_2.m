function [aeroForces] = paramSpace_1_2_3_3_3_1_2(sailStates,airStates)

	CL = (4.400043)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.535236)*sailStates.p + (37.329735)*sailStates.q + (-1.654759)*sailStates.r + (0.011266)*sailStates.de;
	CD = -0.252140;
	CY = (0.066019)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.561610)*sailStates.p + (0.491626)*sailStates.q + (-0.098980)*sailStates.r + (0.000105)*sailStates.de;

	Cl = (1.427515)*sailStates.alpha + (0.261190)*sailStates.beta + (-1.181147)*sailStates.p + (10.455618)*sailStates.q + (-1.289285)*sailStates.r + (0.000306)*sailStates.de;
	Cm = (-13.532052)*sailStates.alpha + (0.000000)*sailStates.beta + (7.793175)*sailStates.p + (-134.907364)*sailStates.q + (5.493768)*sailStates.r + (-0.068311)*sailStates.de;
	Cn = (-0.082888)*sailStates.alpha + (0.046055)*sailStates.beta + (1.099302)*sailStates.p + (-4.813487)*sailStates.q + (0.002949)*sailStates.r + (-0.000245)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end