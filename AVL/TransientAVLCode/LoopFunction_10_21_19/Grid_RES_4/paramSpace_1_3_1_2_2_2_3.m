function [aeroForces] = paramSpace_1_3_1_2_2_2_3(sailStates,airStates)

	CL = (3.726338)*sailStates.alpha + (0.086285)*sailStates.beta + (-2.866379)*sailStates.p + (38.658161)*sailStates.q + (-1.155821)*sailStates.r + (0.010698)*sailStates.de;
	CD = 0.102200;
	CY = (-0.011731)*sailStates.alpha + (-0.024625)*sailStates.beta + (-0.291367)*sailStates.p + (0.301043)*sailStates.q + (-0.057989)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.296345)*sailStates.alpha + (0.160167)*sailStates.beta + (-1.464772)*sailStates.p + (12.774430)*sailStates.q + (-0.837528)*sailStates.r + (0.000805)*sailStates.de;
	Cm = (-13.122336)*sailStates.alpha + (-0.338670)*sailStates.beta + (9.406953)*sailStates.p + (-145.703583)*sailStates.q + (3.911416)*sailStates.r + (-0.068813)*sailStates.de;
	Cn = (0.284106)*sailStates.alpha + (0.027817)*sailStates.beta + (0.381140)*sailStates.p + (-0.815848)*sailStates.q + (-0.033054)*sailStates.r + (-0.000102)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end