function [aeroForces] = paramSpace_10_1_1_1_1_2_1(sailStates,airStates)

	CL = (5.199573)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.083102)*sailStates.p + (32.539196)*sailStates.q + (1.809389)*sailStates.r + (0.011193)*sailStates.de;
	CD = -0.959140;
	CY = (-0.279466)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.799581)*sailStates.p + (-0.839977)*sailStates.q + (-0.055823)*sailStates.r + (-0.000180)*sailStates.de;

	Cl = (1.501573)*sailStates.alpha + (-0.365847)*sailStates.beta + (-0.796689)*sailStates.p + (6.378159)*sailStates.q + (1.557925)*sailStates.r + (-0.000346)*sailStates.de;
	Cm = (-14.323230)*sailStates.alpha + (0.000000)*sailStates.beta + (6.634747)*sailStates.p + (-122.784714)*sailStates.q + (-6.092433)*sailStates.r + (-0.068758)*sailStates.de;
	Cn = (1.035506)*sailStates.alpha + (0.025583)*sailStates.beta + (-1.743566)*sailStates.p + (8.562996)*sailStates.q + (0.016527)*sailStates.r + (0.000382)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end