function [aeroForces] = paramSpace_1_2_3_1_3_1_1(sailStates,airStates)

	CL = (7.460191)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.751370)*sailStates.p + (35.248707)*sailStates.q + (-3.239764)*sailStates.r + (0.011846)*sailStates.de;
	CD = -2.966270;
	CY = (0.686083)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.388094)*sailStates.p + (1.081941)*sailStates.q + (-0.244656)*sailStates.r + (0.000226)*sailStates.de;

	Cl = (2.299304)*sailStates.alpha + (0.650880)*sailStates.beta + (-0.490673)*sailStates.p + (5.097095)*sailStates.q + (-2.762502)*sailStates.r + (-0.000880)*sailStates.de;
	Cm = (-11.335370)*sailStates.alpha + (-0.000000)*sailStates.beta + (3.706411)*sailStates.p + (-109.437057)*sailStates.q + (10.725462)*sailStates.r + (-0.066001)*sailStates.de;
	Cn = (-2.618009)*sailStates.alpha + (0.114768)*sailStates.beta + (3.083460)*sailStates.p + (-14.801224)*sailStates.q + (0.071562)*sailStates.r + (-0.000511)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end