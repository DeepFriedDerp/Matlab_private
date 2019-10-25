function [aeroForces] = paramSpace_2_3_3_2_2_2_3(sailStates,airStates)

	CL = (3.987744)*sailStates.alpha + (0.022053)*sailStates.beta + (-2.969004)*sailStates.p + (38.219280)*sailStates.q + (-0.381623)*sailStates.r + (0.011257)*sailStates.de;
	CD = 0.029680;
	CY = (-0.001454)*sailStates.alpha + (-0.024944)*sailStates.beta + (-0.084389)*sailStates.p + (0.100924)*sailStates.q + (-0.005528)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.356390)*sailStates.alpha + (0.046677)*sailStates.beta + (-1.520338)*sailStates.p + (12.633153)*sailStates.q + (-0.258582)*sailStates.r + (0.000834)*sailStates.de;
	Cm = (-14.445456)*sailStates.alpha + (-0.069526)*sailStates.beta + (10.101097)*sailStates.p + (-148.239990)*sailStates.q + (1.279844)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (0.089034)*sailStates.alpha + (0.002631)*sailStates.beta + (0.103652)*sailStates.p + (-0.266620)*sailStates.q + (-0.003661)*sailStates.r + (-0.000047)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end