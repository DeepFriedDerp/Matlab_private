function [aeroForces] = paramSpace_4_2_1_2_2_3_3(sailStates,airStates)

	CL = (4.476820)*sailStates.alpha + (0.144518)*sailStates.beta + (-2.946076)*sailStates.p + (42.113636)*sailStates.q + (2.151116)*sailStates.r + (0.011684)*sailStates.de;
	CD = -0.485510;
	CY = (0.082122)*sailStates.alpha + (-0.025265)*sailStates.beta + (0.716362)*sailStates.p + (-0.301045)*sailStates.q + (-0.142461)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.533217)*sailStates.alpha + (-0.297796)*sailStates.beta + (-1.521900)*sailStates.p + (14.115864)*sailStates.q + (1.720761)*sailStates.r + (0.000892)*sailStates.de;
	Cm = (-12.457664)*sailStates.alpha + (-0.507827)*sailStates.beta + (8.769668)*sailStates.p + (-145.703583)*sailStates.q + (-7.115259)*sailStates.r + (-0.068813)*sailStates.de;
	Cn = (-0.477528)*sailStates.alpha + (0.069039)*sailStates.beta + (-1.375391)*sailStates.p + (5.485037)*sailStates.q + (-0.008786)*sailStates.r + (0.000235)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end