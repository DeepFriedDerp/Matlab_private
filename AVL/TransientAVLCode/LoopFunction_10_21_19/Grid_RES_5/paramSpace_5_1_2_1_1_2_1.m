function [aeroForces] = paramSpace_5_1_2_1_1_2_1(sailStates,airStates)

	CL = (4.882245)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.007589)*sailStates.p + (28.394629)*sailStates.q + (1.108456)*sailStates.r + (0.010236)*sailStates.de;
	CD = -0.859310;
	CY = (-0.279370)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.665436)*sailStates.p + (-1.178228)*sailStates.q + (0.069982)*sailStates.r + (-0.000251)*sailStates.de;

	Cl = (1.361454)*sailStates.alpha + (-0.285257)*sailStates.beta + (-0.778842)*sailStates.p + (5.274055)*sailStates.q + (1.117423)*sailStates.r + (-0.000286)*sailStates.de;
	Cm = (-15.839345)*sailStates.alpha + (0.000000)*sailStates.beta + (7.600227)*sailStates.p + (-123.632645)*sailStates.q + (-3.701838)*sailStates.r + (-0.068451)*sailStates.de;
	Cn = (1.038116)*sailStates.alpha + (-0.029982)*sailStates.beta + (-1.532507)*sailStates.p + (8.026958)*sailStates.q + (-0.035095)*sailStates.r + (0.000459)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end