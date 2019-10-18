function [aeroForces] = paramSpace_1_2_2_1_2_1_1(sailStates,airStates)

	CL = (8.206795)*sailStates.alpha + (-0.633669)*sailStates.beta + (-2.587206)*sailStates.p + (28.884695)*sailStates.q + (0.641351)*sailStates.r + (0.008641)*sailStates.de;
	CD = -5.882950;
	CY = (1.946954)*sailStates.alpha + (-0.004358)*sailStates.beta + (-0.084842)*sailStates.p + (15.839864)*sailStates.q + (-0.006682)*sailStates.r + (0.003375)*sailStates.de;

	Cl = (-2.739104)*sailStates.alpha + (-0.630172)*sailStates.beta + (-1.394369)*sailStates.p + (11.357076)*sailStates.q + (1.309114)*sailStates.r + (0.000379)*sailStates.de;
	Cm = (-11.337559)*sailStates.alpha + (3.018416)*sailStates.beta + (9.534132)*sailStates.p + (-138.926392)*sailStates.q + (-2.431179)*sailStates.r + (-0.068488)*sailStates.de;
	Cn = (-2.118157)*sailStates.alpha + (-0.086277)*sailStates.beta + (-0.425110)*sailStates.p + (-9.548850)*sailStates.q + (0.131243)*sailStates.r + (-0.004472)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end