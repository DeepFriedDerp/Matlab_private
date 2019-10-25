function [aeroForces] = paramSpace_2_2_1_2_3_1_2(sailStates,airStates)

	CL = (4.844515)*sailStates.alpha + (-0.122070)*sailStates.beta + (-2.584880)*sailStates.p + (36.244019)*sailStates.q + (-1.556751)*sailStates.r + (0.011237)*sailStates.de;
	CD = -0.617510;
	CY = (0.099559)*sailStates.alpha + (-0.025332)*sailStates.beta + (-0.699302)*sailStates.p + (0.769434)*sailStates.q + (-0.045916)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.650373)*sailStates.alpha + (0.284228)*sailStates.beta + (-1.227689)*sailStates.p + (10.321967)*sailStates.q + (-1.374066)*sailStates.r + (0.000370)*sailStates.de;
	Cm = (-14.470973)*sailStates.alpha + (0.493515)*sailStates.beta + (8.439139)*sailStates.p + (-136.832825)*sailStates.q + (5.297566)*sailStates.r + (-0.070027)*sailStates.de;
	Cn = (-0.244104)*sailStates.alpha + (0.021760)*sailStates.beta + (1.460068)*sailStates.p + (-6.828742)*sailStates.q + (0.010713)*sailStates.r + (-0.000325)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end