function [aeroForces] = paramSpace_13_1_2_1_2_2_1(sailStates,airStates)

	CL = (4.465778)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.120088)*sailStates.p + (34.973965)*sailStates.q + (1.746913)*sailStates.r + (0.011365)*sailStates.de;
	CD = -0.597340;
	CY = (0.048979)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.580627)*sailStates.p + (1.304043)*sailStates.q + (-0.102427)*sailStates.r + (0.000275)*sailStates.de;

	Cl = (0.905260)*sailStates.alpha + (-0.342335)*sailStates.beta + (-0.811727)*sailStates.p + (7.035507)*sailStates.q + (1.448390)*sailStates.r + (-0.000257)*sailStates.de;
	Cm = (-11.809448)*sailStates.alpha + (0.000000)*sailStates.beta + (6.243600)*sailStates.p + (-122.917580)*sailStates.q + (-5.834262)*sailStates.r + (-0.067165)*sailStates.de;
	Cn = (0.484195)*sailStates.alpha + (0.060363)*sailStates.beta + (-1.254954)*sailStates.p + (4.424200)*sailStates.q + (-0.008816)*sailStates.r + (-0.000273)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end