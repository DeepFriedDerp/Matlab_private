function [aeroForces] = paramSpace_1_1_2_2_2_2_3(sailStates,airStates)

	CL = (3.714147)*sailStates.alpha + (-0.236017)*sailStates.beta + (-2.848304)*sailStates.p + (38.340511)*sailStates.q + (-1.139303)*sailStates.r + (0.010626)*sailStates.de;
	CD = 0.082580;
	CY = (-0.009205)*sailStates.alpha + (-0.025775)*sailStates.beta + (-0.275061)*sailStates.p + (0.301044)*sailStates.q + (-0.054724)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.360150)*sailStates.alpha + (0.043995)*sailStates.beta + (-1.519254)*sailStates.p + (13.489241)*sailStates.q + (-0.821049)*sailStates.r + (0.000968)*sailStates.de;
	Cm = (-13.118542)*sailStates.alpha + (0.873578)*sailStates.beta + (9.355289)*sailStates.p + (-144.677322)*sailStates.q + (3.833279)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (0.311873)*sailStates.alpha + (0.020658)*sailStates.beta + (0.344184)*sailStates.p + (-0.641904)*sailStates.q + (-0.034755)*sailStates.r + (-0.000113)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end