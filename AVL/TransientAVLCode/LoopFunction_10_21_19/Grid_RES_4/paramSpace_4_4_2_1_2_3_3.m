function [aeroForces] = paramSpace_4_4_2_1_2_3_3(sailStates,airStates)

	CL = (6.130908)*sailStates.alpha + (-0.763262)*sailStates.beta + (-3.483979)*sailStates.p + (50.185810)*sailStates.q + (3.568877)*sailStates.r + (0.012547)*sailStates.de;
	CD = -2.425860;
	CY = (0.413236)*sailStates.alpha + (-0.022747)*sailStates.beta + (1.349956)*sailStates.p + (-0.662189)*sailStates.q + (-0.268499)*sailStates.r + (-0.000141)*sailStates.de;

	Cl = (2.010825)*sailStates.alpha + (-0.882794)*sailStates.beta + (-1.860574)*sailStates.p + (18.067665)*sailStates.q + (3.020020)*sailStates.r + (0.001335)*sailStates.de;
	Cm = (-9.970939)*sailStates.alpha + (2.824483)*sailStates.beta + (9.394580)*sailStates.p + (-157.701080)*sailStates.q + (-11.803326)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (-1.784959)*sailStates.alpha + (0.121913)*sailStates.beta + (-2.733088)*sailStates.p + (11.490285)*sailStates.q + (0.016503)*sailStates.r + (0.000472)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end