function [aeroForces] = paramSpace_4_1_1_1_1_2_2(sailStates,airStates)

	CL = (4.647697)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.981337)*sailStates.p + (35.977520)*sailStates.q + (0.676630)*sailStates.r + (0.010384)*sailStates.de;
	CD = -0.746590;
	CY = (0.033808)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.530568)*sailStates.p + (-0.696928)*sailStates.q + (0.074641)*sailStates.r + (-0.000151)*sailStates.de;

	Cl = (1.720556)*sailStates.alpha + (-0.237335)*sailStates.beta + (-1.589971)*sailStates.p + (12.830684)*sailStates.q + (0.768991)*sailStates.r + (0.001057)*sailStates.de;
	Cm = (-15.189875)*sailStates.alpha + (0.000000)*sailStates.beta + (10.986058)*sailStates.p + (-151.165665)*sailStates.q + (-2.190847)*sailStates.r + (-0.070716)*sailStates.de;
	Cn = (0.016605)*sailStates.alpha + (-0.033355)*sailStates.beta + (-1.396187)*sailStates.p + (7.740256)*sailStates.q + (-0.057075)*sailStates.r + (0.000347)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end