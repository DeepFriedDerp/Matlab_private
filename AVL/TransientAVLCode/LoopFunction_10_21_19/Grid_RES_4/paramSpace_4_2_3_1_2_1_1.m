function [aeroForces] = paramSpace_4_2_3_1_2_1_1(sailStates,airStates)

	CL = (5.420268)*sailStates.alpha + (-0.118400)*sailStates.beta + (-1.457734)*sailStates.p + (20.109297)*sailStates.q + (-1.605125)*sailStates.r + (0.008657)*sailStates.de;
	CD = -2.047960;
	CY = (0.413295)*sailStates.alpha + (-0.024249)*sailStates.beta + (-0.908442)*sailStates.p + (0.662190)*sailStates.q + (0.180724)*sailStates.r + (0.000138)*sailStates.de;

	Cl = (1.045790)*sailStates.alpha + (0.389076)*sailStates.beta + (-0.425398)*sailStates.p + (1.275153)*sailStates.q + (-1.677376)*sailStates.r + (-0.000734)*sailStates.de;
	Cm = (-16.287699)*sailStates.alpha + (0.451223)*sailStates.beta + (6.887887)*sailStates.p + (-110.966957)*sailStates.q + (5.208683)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (-1.967603)*sailStates.alpha + (-0.089089)*sailStates.beta + (2.112546)*sailStates.p + (-10.054839)*sailStates.q + (-0.069758)*sailStates.r + (-0.000342)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end