function [aeroForces] = paramSpace_11_1_1_1_2_1_1(sailStates,airStates)

	CL = (4.953945)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.008214)*sailStates.p + (28.342196)*sailStates.q + (-1.124267)*sailStates.r + (0.010332)*sailStates.de;
	CD = -0.899270;
	CY = (0.285691)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.694968)*sailStates.p + (1.178225)*sailStates.q + (0.072919)*sailStates.r + (0.000251)*sailStates.de;

	Cl = (1.372442)*sailStates.alpha + (0.300015)*sailStates.beta + (-0.779181)*sailStates.p + (5.271612)*sailStates.q + (-1.164373)*sailStates.r + (-0.000286)*sailStates.de;
	Cm = (-16.068729)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.609804)*sailStates.p + (-123.632645)*sailStates.q + (3.792960)*sailStates.r + (-0.068451)*sailStates.de;
	Cn = (-1.055604)*sailStates.alpha + (-0.031533)*sailStates.beta + (1.576265)*sailStates.p + (-8.050208)*sailStates.q + (-0.034834)*sailStates.r + (-0.000446)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end