function [aeroForces] = paramSpace_1_3_4_2_2_1_3(sailStates,airStates)

	CL = (4.476820)*sailStates.alpha + (0.144518)*sailStates.beta + (-2.946076)*sailStates.p + (42.113640)*sailStates.q + (-2.151116)*sailStates.r + (0.011684)*sailStates.de;
	CD = -0.485510;
	CY = (-0.082122)*sailStates.alpha + (-0.024687)*sailStates.beta + (-0.716362)*sailStates.p + (0.301045)*sailStates.q + (-0.142461)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.495670)*sailStates.alpha + (0.393600)*sailStates.beta + (-1.490352)*sailStates.p + (13.718897)*sailStates.q + (-1.714529)*sailStates.r + (0.000805)*sailStates.de;
	Cm = (-12.457664)*sailStates.alpha + (-0.507827)*sailStates.beta + (8.769669)*sailStates.p + (-145.703583)*sailStates.q + (7.115260)*sailStates.r + (-0.068813)*sailStates.de;
	Cn = (0.438661)*sailStates.alpha + (0.068488)*sailStates.beta + (1.381667)*sailStates.p + (-5.563998)*sailStates.q + (-0.007546)*sailStates.r + (-0.000235)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end