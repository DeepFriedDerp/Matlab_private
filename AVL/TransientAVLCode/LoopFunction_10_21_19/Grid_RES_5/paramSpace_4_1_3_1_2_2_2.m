function [aeroForces] = paramSpace_4_1_3_1_2_2_2(sailStates,airStates)

	CL = (4.292883)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.941332)*sailStates.p + (36.134602)*sailStates.q + (0.193343)*sailStates.r + (0.010505)*sailStates.de;
	CD = -0.472310;
	CY = (0.202740)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.249299)*sailStates.p + (1.241892)*sailStates.q + (0.035081)*sailStates.r + (0.000268)*sailStates.de;

	Cl = (1.354193)*sailStates.alpha + (-0.174466)*sailStates.beta + (-1.564902)*sailStates.p + (12.899574)*sailStates.q + (0.406551)*sailStates.r + (0.000962)*sailStates.de;
	Cm = (-14.777319)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.527899)*sailStates.p + (-149.211060)*sailStates.q + (-0.649185)*sailStates.r + (-0.070499)*sailStates.de;
	Cn = (-0.108344)*sailStates.alpha + (-0.024520)*sailStates.beta + (-0.794138)*sailStates.p + (3.383918)*sailStates.q + (-0.023681)*sailStates.r + (-0.000291)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end