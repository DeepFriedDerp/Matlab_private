function [aeroForces] = paramSpace_1_3_2_2_2_1_1(sailStates,airStates)

	CL = (4.451230)*sailStates.alpha + (0.356074)*sailStates.beta + (-2.163909)*sailStates.p + (34.918110)*sailStates.q + (-1.755127)*sailStates.r + (0.011052)*sailStates.de;
	CD = -0.484990;
	CY = (0.071152)*sailStates.alpha + (-0.025506)*sailStates.beta + (-0.624829)*sailStates.p + (-0.267958)*sailStates.q + (-0.110174)*sailStates.r + (-0.000056)*sailStates.de;

	Cl = (1.096869)*sailStates.alpha + (0.417301)*sailStates.beta + (-0.825759)*sailStates.p + (7.077815)*sailStates.q + (-1.426620)*sailStates.r + (-0.000292)*sailStates.de;
	Cm = (-12.286145)*sailStates.alpha + (-1.338563)*sailStates.beta + (6.392288)*sailStates.p + (-123.711845)*sailStates.q + (5.857327)*sailStates.r + (-0.066408)*sailStates.de;
	Cn = (-0.546067)*sailStates.alpha + (0.054474)*sailStates.beta + (1.314487)*sailStates.p + (-5.429078)*sailStates.q + (0.005902)*sailStates.r + (-0.000021)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end