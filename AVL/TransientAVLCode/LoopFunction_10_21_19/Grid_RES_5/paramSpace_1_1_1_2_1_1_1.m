function [aeroForces] = paramSpace_1_1_1_2_1_1_1(sailStates,airStates)

	CL = (3.846981)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.292541)*sailStates.p + (36.118416)*sailStates.q + (-1.575743)*sailStates.r + (0.010621)*sailStates.de;
	CD = -0.039890;
	CY = (-0.037415)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.446316)*sailStates.p + (-0.596615)*sailStates.q + (-0.111214)*sailStates.r + (-0.000125)*sailStates.de;

	Cl = (1.064360)*sailStates.alpha + (0.246599)*sailStates.beta + (-0.995622)*sailStates.p + (8.960615)*sailStates.q + (-1.210991)*sailStates.r + (0.000093)*sailStates.de;
	Cm = (-11.721149)*sailStates.alpha + (0.000000)*sailStates.beta + (6.898657)*sailStates.p + (-128.528122)*sailStates.q + (5.252177)*sailStates.r + (-0.065887)*sailStates.de;
	Cn = (-0.040231)*sailStates.alpha + (0.061484)*sailStates.beta + (0.826168)*sailStates.p + (-2.404789)*sailStates.q + (-0.034446)*sailStates.r + (0.000118)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end