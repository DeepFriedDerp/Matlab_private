function [aeroForces] = paramSpace_4_3_2_3_1_2_3(sailStates,airStates)

	CL = (3.929065)*sailStates.alpha + (-0.075753)*sailStates.beta + (-2.716773)*sailStates.p + (37.475239)*sailStates.q + (1.208174)*sailStates.r + (0.010802)*sailStates.de;
	CD = 0.048540;
	CY = (-0.052603)*sailStates.alpha + (-0.024272)*sailStates.beta + (0.323181)*sailStates.p + (-0.684401)*sailStates.q + (-0.064260)*sailStates.r + (-0.000146)*sailStates.de;

	Cl = (1.330586)*sailStates.alpha + (-0.161118)*sailStates.beta + (-1.344280)*sailStates.p + (11.714429)*sailStates.q + (0.847818)*sailStates.r + (0.000589)*sailStates.de;
	Cm = (-13.723462)*sailStates.alpha + (0.260077)*sailStates.beta + (8.818474)*sailStates.p + (-141.172913)*sailStates.q + (-4.028601)*sailStates.r + (-0.068333)*sailStates.de;
	Cn = (-0.150661)*sailStates.alpha + (0.027126)*sailStates.beta + (-0.488454)*sailStates.p + (1.879830)*sailStates.q + (-0.018366)*sailStates.r + (0.000244)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end