function [aeroForces] = paramSpace_1_3_1_1_1_1_1(sailStates,airStates)

	CL = (5.279710)*sailStates.alpha + (0.560509)*sailStates.beta + (-1.821386)*sailStates.p + (34.634151)*sailStates.q + (-2.393751)*sailStates.r + (0.011501)*sailStates.de;
	CD = -1.826990;
	CY = (0.021901)*sailStates.alpha + (-0.031086)*sailStates.beta + (-0.891592)*sailStates.p + (-2.260755)*sailStates.q + (-0.156997)*sailStates.r + (-0.000471)*sailStates.de;

	Cl = (0.461501)*sailStates.alpha + (0.660177)*sailStates.beta + (-0.494658)*sailStates.p + (4.350157)*sailStates.q + (-2.106657)*sailStates.r + (-0.000796)*sailStates.de;
	Cm = (-8.713283)*sailStates.alpha + (-2.222384)*sailStates.beta + (4.649909)*sailStates.p + (-112.748650)*sailStates.q + (8.014552)*sailStates.r + (-0.065445)*sailStates.de;
	Cn = (-1.493867)*sailStates.alpha + (0.093154)*sailStates.beta + (2.028278)*sailStates.p + (-7.339433)*sailStates.q + (0.000946)*sailStates.r + (0.000507)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end