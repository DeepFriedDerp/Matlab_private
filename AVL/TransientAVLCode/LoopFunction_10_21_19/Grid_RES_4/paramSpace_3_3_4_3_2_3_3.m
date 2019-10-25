function [aeroForces] = paramSpace_3_3_4_3_2_3_3(sailStates,airStates)

	CL = (4.246672)*sailStates.alpha + (-0.086580)*sailStates.beta + (-2.843515)*sailStates.p + (37.883278)*sailStates.q + (1.033920)*sailStates.r + (0.011281)*sailStates.de;
	CD = -0.188320;
	CY = (0.036750)*sailStates.alpha + (-0.024946)*sailStates.beta + (0.417061)*sailStates.p + (-0.065300)*sailStates.q + (-0.027343)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.392307)*sailStates.alpha + (-0.228615)*sailStates.beta + (-1.409491)*sailStates.p + (11.764651)*sailStates.q + (0.902284)*sailStates.r + (0.000645)*sailStates.de;
	Cm = (-14.173739)*sailStates.alpha + (0.358410)*sailStates.beta + (9.475179)*sailStates.p + (-144.341232)*sailStates.q + (-3.536242)*sailStates.r + (-0.070808)*sailStates.de;
	Cn = (-0.100910)*sailStates.alpha + (0.013274)*sailStates.beta + (-0.836254)*sailStates.p + (3.425658)*sailStates.q + (0.001431)*sailStates.r + (0.000074)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end