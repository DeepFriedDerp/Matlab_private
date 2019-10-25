function [aeroForces] = paramSpace_1_1_1_2_1_1_2(sailStates,airStates)

	CL = (3.366496)*sailStates.alpha + (0.203577)*sailStates.beta + (-4.451998)*sailStates.p + (47.172310)*sailStates.q + (0.579317)*sailStates.r + (0.010852)*sailStates.de;
	CD = -1.314640;
	CY = (0.631371)*sailStates.alpha + (-0.029135)*sailStates.beta + (0.473894)*sailStates.p + (1.859151)*sailStates.q + (0.062258)*sailStates.r + (0.000410)*sailStates.de;

	Cl = (0.872674)*sailStates.alpha + (-0.290517)*sailStates.beta + (-2.870970)*sailStates.p + (24.975021)*sailStates.q + (0.768199)*sailStates.r + (0.003230)*sailStates.de;
	Cm = (-8.660888)*sailStates.alpha + (-0.824312)*sailStates.beta + (15.946217)*sailStates.p + (-191.444000)*sailStates.q + (-1.909273)*sailStates.r + (-0.074884)*sailStates.de;
	Cn = (-1.884349)*sailStates.alpha + (-0.047408)*sailStates.beta + (-1.498053)*sailStates.p + (7.051499)*sailStates.q + (-0.046203)*sailStates.r + (-0.000345)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end