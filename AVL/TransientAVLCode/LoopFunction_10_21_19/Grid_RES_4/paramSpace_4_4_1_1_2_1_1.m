function [aeroForces] = paramSpace_4_4_1_1_2_1_1(sailStates,airStates)

	CL = (5.487937)*sailStates.alpha + (0.395108)*sailStates.beta + (-1.439716)*sailStates.p + (19.745590)*sailStates.q + (-1.626501)*sailStates.r + (0.008680)*sailStates.de;
	CD = -2.121290;
	CY = (0.424072)*sailStates.alpha + (-0.026687)*sailStates.beta + (-0.938452)*sailStates.p + (0.662189)*sailStates.q + (0.186599)*sailStates.r + (0.000137)*sailStates.de;

	Cl = (0.897512)*sailStates.alpha + (0.555963)*sailStates.beta + (-0.354117)*sailStates.p + (0.402828)*sailStates.q + (-1.740252)*sailStates.r + (-0.000898)*sailStates.de;
	Cm = (-16.454103)*sailStates.alpha + (-1.614985)*sailStates.beta + (6.841671)*sailStates.p + (-109.940704)*sailStates.q + (5.314211)*sailStates.r + (-0.064501)*sailStates.de;
	Cn = (-2.049179)*sailStates.alpha + (-0.076112)*sailStates.beta + (2.144953)*sailStates.p + (-9.925039)*sailStates.q + (-0.066762)*sailStates.r + (-0.000332)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end