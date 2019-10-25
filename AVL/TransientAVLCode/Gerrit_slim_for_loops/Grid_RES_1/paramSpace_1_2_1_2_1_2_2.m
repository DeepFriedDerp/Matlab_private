function [aeroForces] = paramSpace_1_2_1_2_1_2_2(sailStates,airStates)

	CL = (7.181260)*sailStates.alpha + (-0.406723)*sailStates.beta + (-2.540869)*sailStates.p + (30.202566)*sailStates.q + (-0.029367)*sailStates.r + (0.008947)*sailStates.de;
	CD = -3.667280;
	CY = (1.779034)*sailStates.alpha + (0.000043)*sailStates.beta + (-0.374664)*sailStates.p + (14.524740)*sailStates.q + (-0.047268)*sailStates.r + (0.003091)*sailStates.de;

	Cl = (-0.862242)*sailStates.alpha + (-0.389431)*sailStates.beta + (-1.325677)*sailStates.p + (11.008096)*sailStates.q + (0.611065)*sailStates.r + (0.000274)*sailStates.de;
	Cm = (-14.567049)*sailStates.alpha + (2.001515)*sailStates.beta + (8.958371)*sailStates.p + (-136.724289)*sailStates.q + (-0.121950)*sailStates.r + (-0.068263)*sailStates.de;
	Cn = (-1.769175)*sailStates.alpha + (-0.069638)*sailStates.beta + (0.258011)*sailStates.p + (-11.542249)*sailStates.q + (0.133575)*sailStates.r + (-0.004133)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end