function [aeroForces] = paramSpace_1_1_3_1_2_2_1(sailStates,airStates)

	CL = (3.554334)*sailStates.alpha + (-0.147014)*sailStates.beta + (-1.609290)*sailStates.p + (27.725199)*sailStates.q + (-0.632416)*sailStates.r + (0.010134)*sailStates.de;
	CD = 0.048280;
	CY = (-0.041181)*sailStates.alpha + (-0.022747)*sailStates.beta + (-0.107703)*sailStates.p + (-0.662188)*sailStates.q + (-0.021447)*sailStates.r + (-0.000137)*sailStates.de;

	Cl = (0.641430)*sailStates.alpha + (0.046524)*sailStates.beta + (-0.502012)*sailStates.p + (3.687197)*sailStates.q + (-0.389566)*sailStates.r + (-0.000648)*sailStates.de;
	Cm = (-12.698614)*sailStates.alpha + (0.512183)*sailStates.beta + (5.361156)*sailStates.p + (-109.940704)*sailStates.q + (2.128841)*sailStates.r + (-0.064501)*sailStates.de;
	Cn = (-0.089880)*sailStates.alpha + (0.013689)*sailStates.beta + (0.205653)*sailStates.p + (-0.378429)*sailStates.q + (-0.016718)*sailStates.r + (0.000176)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end