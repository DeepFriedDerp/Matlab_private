function [aeroForces] = paramSpace_1_2_2_1_3_1_1(sailStates,airStates)

	CL = (7.457232)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.750771)*sailStates.p + (35.305729)*sailStates.q + (-3.249588)*sailStates.r + (0.011744)*sailStates.de;
	CD = -2.995770;
	CY = (0.693302)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.407203)*sailStates.p + (1.081936)*sailStates.q + (-0.248128)*sailStates.r + (0.000226)*sailStates.de;

	Cl = (2.312749)*sailStates.alpha + (0.660443)*sailStates.beta + (-0.490351)*sailStates.p + (5.099800)*sailStates.q + (-2.792947)*sailStates.r + (-0.000880)*sailStates.de;
	Cm = (-11.105189)*sailStates.alpha + (0.000001)*sailStates.beta + (3.696993)*sailStates.p + (-109.437057)*sailStates.q + (10.778876)*sailStates.r + (-0.066001)*sailStates.de;
	Cn = (-2.636697)*sailStates.alpha + (0.116454)*sailStates.beta + (3.112087)*sailStates.p + (-14.816564)*sailStates.q + (0.071519)*sailStates.r + (-0.000507)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end