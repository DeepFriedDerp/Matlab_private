function [aeroForces] = paramSpace_3_4_4_2_2_2_3(sailStates,airStates)

	CL = (3.892074)*sailStates.alpha + (-0.108718)*sailStates.beta + (-2.948908)*sailStates.p + (37.986359)*sailStates.q + (0.397704)*sailStates.r + (0.011027)*sailStates.de;
	CD = 0.044850;
	CY = (0.006463)*sailStates.alpha + (-0.024646)*sailStates.beta + (0.113801)*sailStates.p + (-0.100924)*sailStates.q + (-0.007470)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.290934)*sailStates.alpha + (-0.079673)*sailStates.beta + (-1.478358)*sailStates.p + (12.157826)*sailStates.q + (0.302997)*sailStates.r + (0.000739)*sailStates.de;
	Cm = (-14.087008)*sailStates.alpha + (0.481374)*sailStates.beta + (10.027339)*sailStates.p + (-147.195892)*sailStates.q + (-1.379824)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (-0.097715)*sailStates.alpha + (0.003884)*sailStates.beta + (-0.149325)*sailStates.p + (0.314065)*sailStates.q + (-0.003983)*sailStates.r + (0.000022)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end