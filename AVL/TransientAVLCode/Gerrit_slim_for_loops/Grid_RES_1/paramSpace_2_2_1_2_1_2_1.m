function [aeroForces] = paramSpace_2_2_1_2_1_2_1(sailStates,airStates)

	CL = (5.144709)*sailStates.alpha + (-3.744412)*sailStates.beta + (-3.418668)*sailStates.p + (46.901264)*sailStates.q + (2.122487)*sailStates.r + (0.010409)*sailStates.de;
	CD = -5.621670;
	CY = (1.730814)*sailStates.alpha + (-0.242933)*sailStates.beta + (0.284451)*sailStates.p + (15.167802)*sailStates.q + (-0.028855)*sailStates.r + (0.002886)*sailStates.de;

	Cl = (-5.069230)*sailStates.alpha + (-1.191537)*sailStates.beta + (-1.652210)*sailStates.p + (13.990708)*sailStates.q + (2.352051)*sailStates.r + (0.001191)*sailStates.de;
	Cm = (4.658796)*sailStates.alpha + (16.897463)*sailStates.beta + (10.669266)*sailStates.p + (-150.620224)*sailStates.q + (-7.527158)*sailStates.r + (-0.055194)*sailStates.de;
	Cn = (-1.768762)*sailStates.alpha + (0.340878)*sailStates.beta + (-0.843294)*sailStates.p + (-8.749093)*sailStates.q + (-0.191319)*sailStates.r + (-0.003778)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end