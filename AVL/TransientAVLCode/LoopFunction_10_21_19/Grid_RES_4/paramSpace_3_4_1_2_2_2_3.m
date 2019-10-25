function [aeroForces] = paramSpace_3_4_1_2_2_2_3(sailStates,airStates)

	CL = (3.932870)*sailStates.alpha + (-0.043779)*sailStates.beta + (-2.949753)*sailStates.p + (37.936638)*sailStates.q + (0.369759)*sailStates.r + (0.011119)*sailStates.de;
	CD = 0.032470;
	CY = (-0.001036)*sailStates.alpha + (-0.024710)*sailStates.beta + (0.068905)*sailStates.p + (-0.100924)*sailStates.q + (-0.004506)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.292316)*sailStates.alpha + (-0.054230)*sailStates.beta + (-1.478751)*sailStates.p + (12.155585)*sailStates.q + (0.230700)*sailStates.r + (0.000739)*sailStates.de;
	Cm = (-14.290396)*sailStates.alpha + (0.069286)*sailStates.beta + (10.037995)*sailStates.p + (-147.195892)*sailStates.q + (-1.217239)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (-0.073935)*sailStates.alpha + (0.002378)*sailStates.beta + (-0.083002)*sailStates.p + (0.279868)*sailStates.q + (-0.003629)*sailStates.r + (0.000060)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end