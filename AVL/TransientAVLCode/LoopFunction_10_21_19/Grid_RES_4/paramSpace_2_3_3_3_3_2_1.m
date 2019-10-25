function [aeroForces] = paramSpace_2_3_3_3_3_2_1(sailStates,airStates)

	CL = (4.068546)*sailStates.alpha + (0.024146)*sailStates.beta + (-2.301523)*sailStates.p + (32.879852)*sailStates.q + (-0.425322)*sailStates.r + (0.010932)*sailStates.de;
	CD = 0.019300;
	CY = (0.069302)*sailStates.alpha + (-0.024837)*sailStates.beta + (-0.138142)*sailStates.p + (0.432842)*sailStates.q + (-0.009039)*sailStates.r + (0.000093)*sailStates.de;

	Cl = (1.113156)*sailStates.alpha + (0.060371)*sailStates.beta + (-0.976066)*sailStates.p + (7.620296)*sailStates.q + (-0.294166)*sailStates.r + (-0.000052)*sailStates.de;
	Cm = (-14.678524)*sailStates.alpha + (-0.076884)*sailStates.beta + (7.832268)*sailStates.p + (-129.813766)*sailStates.q + (1.426396)*sailStates.r + (-0.069334)*sailStates.de;
	Cn = (-0.103749)*sailStates.alpha + (0.003262)*sailStates.beta + (0.249521)*sailStates.p + (-1.340775)*sailStates.q + (0.001213)*sailStates.r + (-0.000147)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end