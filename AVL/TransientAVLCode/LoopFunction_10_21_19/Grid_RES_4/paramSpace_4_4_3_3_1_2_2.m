function [aeroForces] = paramSpace_4_4_3_3_1_2_2(sailStates,airStates)

	CL = (3.860771)*sailStates.alpha + (-0.231924)*sailStates.beta + (-2.446478)*sailStates.p + (35.118332)*sailStates.q + (1.108426)*sailStates.r + (0.010428)*sailStates.de;
	CD = 0.055340;
	CY = (-0.062690)*sailStates.alpha + (-0.023177)*sailStates.beta + (0.304970)*sailStates.p + (-0.489620)*sailStates.q + (-0.060680)*sailStates.r + (-0.000103)*sailStates.de;

	Cl = (1.171157)*sailStates.alpha + (-0.201698)*sailStates.beta + (-1.097880)*sailStates.p + (9.264091)*sailStates.q + (0.777321)*sailStates.r + (0.000167)*sailStates.de;
	Cm = (-13.406001)*sailStates.alpha + (0.858445)*sailStates.beta + (7.936856)*sailStates.p + (-133.122269)*sailStates.q + (-3.717751)*sailStates.r + (-0.066591)*sailStates.de;
	Cn = (-0.000586)*sailStates.alpha + (0.026722)*sailStates.beta + (-0.490444)*sailStates.p + (1.913410)*sailStates.q + (-0.013625)*sailStates.r + (0.000170)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end