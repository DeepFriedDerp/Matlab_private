function [aeroForces] = paramSpace_2_1_2_2_2_2_2(sailStates,airStates)

	CL = (3.833928)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.617686)*sailStates.p + (35.178627)*sailStates.q + (-0.700585)*sailStates.r + (0.010242)*sailStates.de;
	CD = 0.029610;
	CY = (0.063094)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.085008)*sailStates.p + (0.571905)*sailStates.q + (-0.018090)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.271232)*sailStates.alpha + (0.019847)*sailStates.beta + (-1.303908)*sailStates.p + (11.049897)*sailStates.q + (-0.384982)*sailStates.r + (0.000575)*sailStates.de;
	Cm = (-14.079762)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.975519)*sailStates.p + (-139.762878)*sailStates.q + (2.389010)*sailStates.r + (-0.067975)*sailStates.de;
	Cn = (0.167300)*sailStates.alpha + (0.004219)*sailStates.beta + (-0.070759)*sailStates.p + (0.847892)*sailStates.q + (-0.037949)*sailStates.r + (-0.000150)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end