function [aeroForces] = paramSpace_1_1_1_1_1_1_1(sailStates,airStates)

	CL = (5.279710)*sailStates.alpha + (-0.560509)*sailStates.beta + (-1.821386)*sailStates.p + (34.634151)*sailStates.q + (-2.393751)*sailStates.r + (0.011501)*sailStates.de;
	CD = -1.826990;
	CY = (0.021901)*sailStates.alpha + (-0.018576)*sailStates.beta + (-0.891592)*sailStates.p + (-2.260755)*sailStates.q + (-0.156997)*sailStates.r + (-0.000471)*sailStates.de;

	Cl = (0.597057)*sailStates.alpha + (0.401557)*sailStates.beta + (-0.579276)*sailStates.p + (5.411024)*sailStates.q + (-2.121678)*sailStates.r + (-0.000571)*sailStates.de;
	Cm = (-8.713281)*sailStates.alpha + (2.222383)*sailStates.beta + (4.649909)*sailStates.p + (-112.748634)*sailStates.q + (8.014553)*sailStates.r + (-0.065445)*sailStates.de;
	Cn = (-1.341653)*sailStates.alpha + (0.094059)*sailStates.beta + (2.013358)*sailStates.p + (-7.152373)*sailStates.q + (-0.001702)*sailStates.r + (0.000507)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end