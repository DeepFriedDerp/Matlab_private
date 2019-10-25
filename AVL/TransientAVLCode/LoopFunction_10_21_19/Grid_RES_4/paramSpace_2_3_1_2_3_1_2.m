function [aeroForces] = paramSpace_2_3_1_2_3_1_2(sailStates,airStates)

	CL = (4.844515)*sailStates.alpha + (0.122070)*sailStates.beta + (-2.584880)*sailStates.p + (36.244019)*sailStates.q + (-1.556750)*sailStates.r + (0.011237)*sailStates.de;
	CD = -0.617510;
	CY = (0.099559)*sailStates.alpha + (-0.024620)*sailStates.beta + (-0.699302)*sailStates.p + (0.769434)*sailStates.q + (-0.045916)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.601758)*sailStates.alpha + (0.352088)*sailStates.beta + (-1.195044)*sailStates.p + (9.918092)*sailStates.q + (-1.371883)*sailStates.r + (0.000283)*sailStates.de;
	Cm = (-14.470973)*sailStates.alpha + (-0.493514)*sailStates.beta + (8.439139)*sailStates.p + (-136.832825)*sailStates.q + (5.297566)*sailStates.r + (-0.070027)*sailStates.de;
	Cn = (-0.275200)*sailStates.alpha + (0.019947)*sailStates.beta + (1.462207)*sailStates.p + (-6.855213)*sailStates.q + (0.010856)*sailStates.r + (-0.000325)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end