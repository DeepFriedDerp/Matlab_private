function [aeroForces] = paramSpace_1_2_3_1_3_2_1(sailStates,airStates)

	CL = (3.891695)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.599396)*sailStates.p + (28.188412)*sailStates.q + (-0.994990)*sailStates.r + (0.010461)*sailStates.de;
	CD = -0.044990;
	CY = (0.273602)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.351839)*sailStates.p + (1.081940)*sailStates.q + (-0.061936)*sailStates.r + (0.000226)*sailStates.de;

	Cl = (0.751966)*sailStates.alpha + (0.132753)*sailStates.beta + (-0.442616)*sailStates.p + (3.233031)*sailStates.q + (-0.676192)*sailStates.r + (-0.000880)*sailStates.de;
	Cm = (-13.165236)*sailStates.alpha + (-0.000000)*sailStates.beta + (5.017111)*sailStates.p + (-109.437057)*sailStates.q + (3.292114)*sailStates.r + (-0.066001)*sailStates.de;
	Cn = (-0.720603)*sailStates.alpha + (0.023408)*sailStates.beta + (0.733093)*sailStates.p + (-4.229593)*sailStates.q + (0.023420)*sailStates.r + (-0.000352)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end