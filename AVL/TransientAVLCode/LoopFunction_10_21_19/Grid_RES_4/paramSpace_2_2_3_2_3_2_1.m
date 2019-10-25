function [aeroForces] = paramSpace_2_2_3_2_3_2_1(sailStates,airStates)

	CL = (4.055140)*sailStates.alpha + (-0.026586)*sailStates.beta + (-2.156817)*sailStates.p + (31.744635)*sailStates.q + (-0.477666)*sailStates.r + (0.010868)*sailStates.de;
	CD = 0.010360;
	CY = (0.113597)*sailStates.alpha + (-0.025191)*sailStates.beta + (-0.176263)*sailStates.p + (0.668510)*sailStates.q + (-0.011529)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.091913)*sailStates.alpha + (0.051088)*sailStates.beta + (-0.891040)*sailStates.p + (6.952731)*sailStates.q + (-0.339026)*sailStates.r + (-0.000156)*sailStates.de;
	Cm = (-14.583400)*sailStates.alpha + (0.085256)*sailStates.beta + (7.327140)*sailStates.p + (-125.787453)*sailStates.q + (1.601290)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (-0.194709)*sailStates.alpha + (0.004232)*sailStates.beta + (0.333269)*sailStates.p + (-1.913957)*sailStates.q + (0.003384)*sailStates.r + (-0.000219)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end